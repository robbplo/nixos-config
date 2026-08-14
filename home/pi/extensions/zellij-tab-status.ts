import { createHash, randomUUID } from "node:crypto";
import {
  mkdir,
  readFile,
  readdir,
  rename,
  rm,
  stat,
  unlink,
  writeFile,
} from "node:fs/promises";
import { tmpdir } from "node:os";
import { join } from "node:path";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

const RECONCILE_INTERVAL_MS = 2_000;
const COMMAND_TIMEOUT_MS = 2_000;
const LOCK_STALE_MS = 10_000;
const LOCK_RETRY_MS = 25;
const LOCK_RETRIES = 80;
const STATE_VERSION = 1;

const INDICATORS = {
  working: "●",
  done: "✓",
  idle: "○",
} as const;

const INDICATOR_PREFIX = /^(?:●|✓|○)\s+/u;

type AgentState = "working" | "idle";
type AggregateState = AgentState | "done" | "none";

type AgentRecord = {
  version: number;
  paneId: number;
  tabId: number;
  pid: number;
  instanceId: string;
  state: AgentState;
  updatedAt: number;
};

type TabRecord = {
  version: number;
  tabId: number;
  baseName: string;
  renderedName: string;
  state: AggregateState;
};

type PaneInfo = {
  id: number;
  is_plugin: boolean;
  tab_id: number;
};

type TabInfo = {
  tab_id: number;
  name: string;
  active: boolean;
};

function parsePaneId(value: string | undefined): number | undefined {
  if (!value || !/^\d+$/.test(value)) return undefined;
  const paneId = Number(value);
  return Number.isSafeInteger(paneId) ? paneId : undefined;
}

function stripIndicator(name: string): string {
  return name.replace(INDICATOR_PREFIX, "");
}

function processExists(pid: number): boolean {
  try {
    process.kill(pid, 0);
    return true;
  } catch (error) {
    return (error as NodeJS.ErrnoException).code === "EPERM";
  }
}

function sleep(milliseconds: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, milliseconds));
}

async function readJson<T>(path: string): Promise<T | undefined> {
  try {
    return JSON.parse(await readFile(path, "utf8")) as T;
  } catch {
    return undefined;
  }
}

async function writeJson(path: string, value: unknown): Promise<void> {
  const temporaryPath = `${path}.${process.pid}.${randomUUID()}.tmp`;
  try {
    await writeFile(temporaryPath, `${JSON.stringify(value)}\n`, {
      encoding: "utf8",
      mode: 0o600,
    });
    await rename(temporaryPath, path);
  } finally {
    await unlink(temporaryPath).catch(() => undefined);
  }
}

async function withLock<T>(directory: string, action: () => Promise<T>): Promise<T> {
  const lockPath = join(directory, ".lock");

  for (let attempt = 0; attempt < LOCK_RETRIES; attempt += 1) {
    try {
      await mkdir(lockPath, { mode: 0o700 });
      try {
        return await action();
      } finally {
        await rm(lockPath, { recursive: true, force: true });
      }
    } catch (error) {
      if ((error as NodeJS.ErrnoException).code !== "EEXIST") throw error;

      const lockStat = await stat(lockPath).catch(() => undefined);
      if (lockStat && Date.now() - lockStat.mtimeMs > LOCK_STALE_MS) {
        await rm(lockPath, { recursive: true, force: true });
        continue;
      }
      await sleep(LOCK_RETRY_MS);
    }
  }

  throw new Error("Timed out waiting for the Pi Zellij status lock");
}

export default function zellijTabStatusExtension(pi: ExtensionAPI) {
  const paneId = parsePaneId(process.env.ZELLIJ_PANE_ID);
  const zellijSession = process.env.ZELLIJ_SESSION_NAME;
  if (paneId === undefined || !zellijSession) return;

  const runtimeRoot = process.env.XDG_RUNTIME_DIR ?? tmpdir();
  const userId = process.getuid?.().toString() ?? "user";
  const sessionKey = createHash("sha256").update(zellijSession).digest("hex").slice(0, 20);
  const stateDirectory = join(runtimeRoot, "pi-zellij-status", userId, sessionKey);
  const ownRecordPath = join(stateDirectory, `pane-${paneId}.json`);
  const instanceId = randomUUID();

  let enabled = false;
  let currentState: AgentState = "idle";
  let timer: ReturnType<typeof setInterval> | undefined;
  let pending = Promise.resolve();

  const runZellijJson = async <T>(args: string[]): Promise<T> => {
    const result = await pi.exec("zellij", args, { timeout: COMMAND_TIMEOUT_MS });
    if (result.code !== 0) {
      throw new Error(result.stderr.trim() || `zellij ${args.join(" ")} failed`);
    }
    return JSON.parse(result.stdout) as T;
  };

  const renameTab = async (tabId: number, name: string): Promise<void> => {
    const result = await pi.exec(
      "zellij",
      ["action", "rename-tab", "--tab-id", tabId.toString(), name],
      { timeout: COMMAND_TIMEOUT_MS },
    );
    if (result.code !== 0) {
      throw new Error(result.stderr.trim() || `Unable to rename Zellij tab ${tabId}`);
    }
  };

  const listStateFiles = async (prefix: string): Promise<string[]> => {
    const entries = await readdir(stateDirectory).catch(() => [] as string[]);
    return entries.filter((entry) => entry.startsWith(prefix) && entry.endsWith(".json"));
  };

  const reconcileLocked = async (knownPanes?: PaneInfo[]): Promise<void> => {
    const [panes, tabs] = await Promise.all([
      knownPanes ?? runZellijJson<PaneInfo[]>(["action", "list-panes", "--json"]),
      runZellijJson<TabInfo[]>(["action", "list-tabs", "--json"]),
    ]);

    const terminalPanes = new Map(
      panes.filter((pane) => !pane.is_plugin).map((pane) => [pane.id, pane]),
    );
    const liveTabs = new Map(tabs.map((tab) => [tab.tab_id, tab]));
    const relevantTabIds = new Set<number>();
    const agentsByTab = new Map<number, AgentRecord[]>();

    for (const file of await listStateFiles("pane-")) {
      const path = join(stateDirectory, file);
      const record = await readJson<AgentRecord>(path);
      if (!record || record.version !== STATE_VERSION) {
        await unlink(path).catch(() => undefined);
        continue;
      }

      relevantTabIds.add(record.tabId);
      const pane = terminalPanes.get(record.paneId);
      if (!pane || !processExists(record.pid)) {
        await unlink(path).catch(() => undefined);
        continue;
      }

      if (record.tabId !== pane.tab_id) {
        record.tabId = pane.tab_id;
        record.updatedAt = Date.now();
        await writeJson(path, record);
      }

      relevantTabIds.add(pane.tab_id);
      const records = agentsByTab.get(pane.tab_id) ?? [];
      records.push(record);
      agentsByTab.set(pane.tab_id, records);
    }

    for (const file of await listStateFiles("tab-")) {
      const match = /^tab-(\d+)\.json$/.exec(file);
      if (match) relevantTabIds.add(Number(match[1]));
    }

    for (const tabId of relevantTabIds) {
      const tabPath = join(stateDirectory, `tab-${tabId}.json`);
      const tab = liveTabs.get(tabId);
      if (!tab) {
        await unlink(tabPath).catch(() => undefined);
        continue;
      }

      const agents = agentsByTab.get(tabId) ?? [];
      const previous = await readJson<TabRecord>(tabPath);
      let baseName = previous?.baseName ?? stripIndicator(tab.name);

      // If the visible name differs from the last name we rendered, assume the
      // user renamed the tab and adopt that name as the new base.
      if (previous && tab.name !== previous.renderedName) {
        baseName = stripIndicator(tab.name);
      }

      let state: AggregateState;
      if (agents.some((agent) => agent.state === "working")) {
        state = "working";
      } else if (agents.length === 0) {
        state = "none";
      } else if (!tab.active && (previous?.state === "working" || previous?.state === "done")) {
        state = "done";
      } else {
        state = "idle";
      }

      const renderedName =
        state === "none" ? baseName : `${INDICATORS[state]} ${baseName}`;
      if (tab.name !== renderedName) await renameTab(tabId, renderedName);

      if (state === "none") {
        await unlink(tabPath).catch(() => undefined);
      } else {
        await writeJson(tabPath, {
          version: STATE_VERSION,
          tabId,
          baseName,
          renderedName,
          state,
        } satisfies TabRecord);
      }
    }
  };

  const publishLocked = async (): Promise<void> => {
    const panes = await runZellijJson<PaneInfo[]>(["action", "list-panes", "--json"]);
    const ownPane = panes.find((pane) => !pane.is_plugin && pane.id === paneId);
    if (!ownPane) return;

    await writeJson(ownRecordPath, {
      version: STATE_VERSION,
      paneId,
      tabId: ownPane.tab_id,
      pid: process.pid,
      instanceId,
      state: currentState,
      updatedAt: Date.now(),
    } satisfies AgentRecord);

    await reconcileLocked(panes);
  };

  const removeLocked = async (): Promise<void> => {
    const record = await readJson<AgentRecord>(ownRecordPath);
    if (record?.instanceId === instanceId) {
      await unlink(ownRecordPath).catch(() => undefined);
    }
    await reconcileLocked();
  };

  const enqueue = (action: () => Promise<void>): Promise<void> => {
    const run = pending.then(action, action).catch(() => undefined);
    pending = run;
    return run;
  };

  const publish = (): Promise<void> =>
    enqueue(async () => {
      await mkdir(stateDirectory, { recursive: true, mode: 0o700 });
      await withLock(stateDirectory, publishLocked);
    });

  const remove = (): Promise<void> =>
    enqueue(async () => {
      await mkdir(stateDirectory, { recursive: true, mode: 0o700 });
      await withLock(stateDirectory, removeLocked);
    });

  pi.on("session_start", async (_event, ctx) => {
    if (ctx.mode !== "tui") return;

    enabled = true;
    currentState = ctx.isIdle() === false ? "working" : "idle";
    await publish();

    timer = setInterval(() => {
      if (enabled) void publish();
    }, RECONCILE_INTERVAL_MS);
    timer.unref?.();
  });

  pi.on("agent_start", async () => {
    if (!enabled) return;
    currentState = "working";
    await publish();
  });

  pi.on("agent_settled", async (_event, ctx) => {
    if (!enabled || ctx.isIdle() !== true) return;
    currentState = "idle";
    await publish();
  });

  pi.on("session_shutdown", async () => {
    if (!enabled) return;

    enabled = false;
    if (timer !== undefined) {
      clearInterval(timer);
      timer = undefined;
    }
    await remove();
  });
}
