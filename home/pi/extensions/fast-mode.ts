import { mkdir, readFile, rename, unlink, writeFile } from "node:fs/promises";
import { join } from "node:path";
import type { Api, Model } from "@earendil-works/pi-ai";
import {
  getAgentDir,
  type ExtensionAPI,
  type ExtensionContext,
} from "@earendil-works/pi-coding-agent";

const STATUS_ID = "fast-mode";
const FAST_SERVICE_TIER = "priority";
const STATE_FILE = join(getAgentDir(), "fast-mode.json");

// Keep this list explicit so newly released models fall back safely until their
// Fast mode support has been verified.
const SUPPORTED_MODEL_PREFIXES = ["gpt-5.4", "gpt-5.5", "gpt-5.6"] as const;

function supportsFastMode(model: Model<Api> | undefined): boolean {
  if (!model) return false;

  const isOpenAIProvider = model.provider === "openai" || model.provider === "openai-codex";
  const isSupportedModel = SUPPORTED_MODEL_PREFIXES.some(
    (prefix) => model.id === prefix || model.id.startsWith(`${prefix}-`),
  );

  return isOpenAIProvider && isSupportedModel;
}

async function loadEnabledState(): Promise<boolean> {
  try {
    const state = JSON.parse(await readFile(STATE_FILE, "utf8")) as { enabled?: unknown };
    return state.enabled === true;
  } catch (error) {
    if ((error as NodeJS.ErrnoException).code !== "ENOENT") {
      console.warn(`Unable to read ${STATE_FILE}; Fast mode will start disabled.`, error);
    }
    return false;
  }
}

async function saveEnabledState(enabled: boolean): Promise<void> {
  const temporaryFile = `${STATE_FILE}.${process.pid}.tmp`;
  await mkdir(getAgentDir(), { recursive: true });

  try {
    await writeFile(temporaryFile, `${JSON.stringify({ enabled })}\n`, {
      encoding: "utf8",
      mode: 0o600,
    });
    await rename(temporaryFile, STATE_FILE);
  } finally {
    await unlink(temporaryFile).catch(() => undefined);
  }
}

export default async function fastModeExtension(pi: ExtensionAPI) {
  let enabled = await loadEnabledState();

  const updateStatus = (ctx: ExtensionContext) => {
    ctx.ui.setStatus(
      STATUS_ID,
      enabled ? ctx.ui.theme.fg("accent", "⚡ Fast") : undefined,
    );
  };

  pi.registerCommand("fast", {
    description: "Toggle OpenAI Fast mode",
    handler: async (_args, ctx) => {
      const nextEnabled = !enabled;

      try {
        await saveEnabledState(nextEnabled);
      } catch (error) {
        ctx.ui.notify(`Unable to save Fast mode setting: ${String(error)}`, "error");
        return;
      }

      enabled = nextEnabled;
      updateStatus(ctx);
      ctx.ui.notify(`Fast mode ${enabled ? "enabled" : "disabled"}`, "info");
    },
  });

  pi.on("session_start", async (_event, ctx) => {
    updateStatus(ctx);
  });

  pi.on("before_agent_start", async (_event, ctx) => {
    if (!enabled || supportsFastMode(ctx.model)) return;

    const model = ctx.model ? `${ctx.model.provider}/${ctx.model.id}` : "the selected model";
    ctx.ui.notify(
      `Fast mode is not supported for ${model} by this extension; continuing in normal mode.`,
      "warning",
    );
  });

  pi.on("before_provider_request", (event, ctx) => {
    if (!enabled || !supportsFastMode(ctx.model)) return;
    if (typeof event.payload !== "object" || event.payload === null || Array.isArray(event.payload)) {
      return;
    }

    return {
      ...event.payload,
      service_tier: FAST_SERVICE_TIER,
    };
  });
}
