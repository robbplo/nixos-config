import type { AssistantMessage } from "@earendil-works/pi-ai";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { truncateToWidth, visibleWidth } from "@earendil-works/pi-tui";

const UPDATE_INTERVAL_MS = 1_000;

function formatElapsed(milliseconds: number): string {
  const totalSeconds = Math.floor(milliseconds / 1_000);
  const seconds = totalSeconds % 60;
  const totalMinutes = Math.floor(totalSeconds / 60);
  const minutes = totalMinutes % 60;
  const hours = Math.floor(totalMinutes / 60);

  if (hours > 0) {
    return `${hours}:${minutes.toString().padStart(2, "0")}:${seconds
      .toString()
      .padStart(2, "0")}`;
  }

  return `${minutes}:${seconds.toString().padStart(2, "0")}`;
}

function formatTokens(count: number): string {
  if (count < 1_000) return count.toString();
  if (count < 10_000) return `${(count / 1_000).toFixed(1)}k`;
  if (count < 1_000_000) return `${Math.round(count / 1_000)}k`;
  return `${(count / 1_000_000).toFixed(1)}M`;
}

export default function elapsedTimeExtension(pi: ExtensionAPI) {
  let startedAt: number | undefined;
  let completedElapsed: number | undefined;
  let timer: ReturnType<typeof setInterval> | undefined;
  let requestRender: (() => void) | undefined;

  const stopTimer = () => {
    if (timer !== undefined) {
      clearInterval(timer);
      timer = undefined;
    }
  };

  pi.on("session_start", async (_event, ctx) => {
    if (ctx.mode !== "tui") return;

    ctx.ui.setFooter((tui, theme, footerData) => {
      const rerender = () => tui.requestRender();
      requestRender = rerender;
      const unsubscribe = footerData.onBranchChange(rerender);

      return {
        invalidate() {},
        dispose() {
          unsubscribe();
          if (requestRender === rerender) requestRender = undefined;
        },
        render(width: number): string[] {
          let input = 0;
          let output = 0;
          let cacheRead = 0;
          let cacheWrite = 0;
          let cost = 0;

          for (const entry of ctx.sessionManager.getEntries()) {
            if (entry.type === "message" && entry.message.role === "assistant") {
              const message = entry.message as AssistantMessage;
              input += message.usage.input;
              output += message.usage.output;
              cacheRead += message.usage.cacheRead;
              cacheWrite += message.usage.cacheWrite;
              cost += message.usage.cost.total;
            }
          }

          const usage = ctx.getContextUsage();
          const contextWindow = usage?.contextWindow ?? ctx.model?.contextWindow ?? 0;
          const contextValue = usage?.percent;
          const contextText = `${contextValue === null || contextValue === undefined ? "?" : contextValue.toFixed(1)}%/${formatTokens(contextWindow)}`;

          let elapsedText: string;
          if (startedAt !== undefined) {
            elapsedText = `${theme.fg("accent", "◷")} ${theme.fg(
              "accent",
              formatElapsed(performance.now() - startedAt),
            )}`;
          } else if (completedElapsed !== undefined) {
            elapsedText = `${theme.fg("success", "✓")} ${theme.fg(
              "dim",
              `${formatElapsed(completedElapsed)} total`,
            )}`;
          } else {
            elapsedText = theme.fg("dim", "◷ --");
          }

          const stats = [
            elapsedText,
            input > 0 ? theme.fg("dim", `↑${formatTokens(input)}`) : undefined,
            output > 0 ? theme.fg("dim", `↓${formatTokens(output)}`) : undefined,
            cacheRead > 0 ? theme.fg("dim", `R${formatTokens(cacheRead)}`) : undefined,
            cacheWrite > 0 ? theme.fg("dim", `W${formatTokens(cacheWrite)}`) : undefined,
            cost > 0 ? theme.fg("dim", `$${cost.toFixed(3)}`) : undefined,
            theme.fg("dim", contextText),
          ].filter((part): part is string => part !== undefined);

          let left = stats.join(" ");
          const model = ctx.model?.id ?? "no-model";
          const thinking = ctx.model?.reasoning ? ` • ${ctx.thinkingLevel}` : "";
          const right = theme.fg("dim", `${model}${thinking}`);
          const availableLeft = Math.max(0, width - visibleWidth(right) - 2);
          left = truncateToWidth(left, availableLeft, "");
          const padding = " ".repeat(Math.max(1, width - visibleWidth(left) - visibleWidth(right)));
          const statsLine = truncateToWidth(left + padding + right, width, "");

          const branch = footerData.getGitBranch();
          const sessionName = ctx.sessionManager.getSessionName();
          const locationParts = [ctx.cwd, branch ? `(${branch})` : undefined, sessionName]
            .filter((part): part is string => Boolean(part))
            .join(" • ");
          const lines = [
            truncateToWidth(theme.fg("dim", locationParts), width, theme.fg("dim", "...")),
            statsLine,
          ];

          const extensionStatuses = [...footerData.getExtensionStatuses().values()];
          if (extensionStatuses.length > 0) {
            lines.push(truncateToWidth(extensionStatuses.join(" "), width, theme.fg("dim", "...")));
          }

          return lines;
        },
      };
    });
  });

  pi.on("before_agent_start", async () => {
    // Keep the original start time across retries, compaction, and queued follow-ups.
    if (startedAt !== undefined) return;

    startedAt = performance.now();
    completedElapsed = undefined;
    requestRender?.();
    timer = setInterval(() => requestRender?.(), UPDATE_INTERVAL_MS);
  });

  pi.on("agent_settled", async () => {
    if (startedAt === undefined) return;

    completedElapsed = performance.now() - startedAt;
    startedAt = undefined;
    stopTimer();
    requestRender?.();
  });

  pi.on("session_shutdown", async (_event, ctx) => {
    stopTimer();
    startedAt = undefined;
    completedElapsed = undefined;
    requestRender = undefined;
    if (ctx.mode === "tui") ctx.ui.setFooter(undefined);
  });
}
