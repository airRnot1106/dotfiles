{ inputs, pkgs, ... }:
let
  hookEvents = [
    "SessionStart"
    "UserPromptSubmit"
    "PreToolUse"
    "PostToolUse"
    "PostToolUseFailure"
    "PermissionRequest"
    "Elicitation"
    "Stop"
    "StopFailure"
    "SessionEnd"
  ];
  nvimAgentState = pkgs.writers.writeBash "herdr-nvim-agent-state.sh" ''
    # herdr detects agents by the pane's foreground process, which is nvim
    # for Claude launched via nvim-aibo, so Claude reports its own state.
    [ -n "''${HERDR_PANE_ID:-}" ] && [ -n "''${HERDR_BIN_PATH:-}" ] || exit 0

    jq=${pkgs.jq}/bin/jq
    input=$(cat)
    [ -n "$("$jq" -r '.agent_id // empty' <<<"$input" 2>/dev/null)" ] && exit 0
    event=$("$jq" -r '.hook_event_name // empty' <<<"$input" 2>/dev/null)
    tool=$("$jq" -r '.tool_name // empty' <<<"$input" 2>/dev/null)

    case "$event" in
      SessionStart | Stop | StopFailure) args=(report-agent --state idle) ;;
      UserPromptSubmit | PreToolUse | PostToolUse | PostToolUseFailure) args=(report-agent --state working) ;;
      PermissionRequest | Elicitation) args=(report-agent --state blocked ''${tool:+--message "$tool"}) ;;
      SessionEnd) args=(release-agent) ;;
      *) exit 0 ;;
    esac

    "$HERDR_BIN_PATH" pane "''${args[0]}" "$HERDR_PANE_ID" \
      --source nvim-aibo-claude --agent claude "''${args[@]:1}" \
      --seq "''${EPOCHREALTIME/./}" >/dev/null 2>&1
    exit 0
  '';
in
{
  home.packages = [
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  home.file.".claude/herdr-nvim.json".text = builtins.toJSON {
    # herdr's official Claude hook also fires inside nvim and takes pane
    # ownership, which makes herdr ignore these reports. It exits unless HERDR_ENV=1.
    env.HERDR_ENV = "0";
    hooks = builtins.listToAttrs (
      map (event: {
        name = event;
        value = [
          {
            hooks = [
              {
                type = "command";
                command = "${nvimAgentState}";
                timeout = 5;
              }
            ];
          }
        ];
      }) hookEvents
    );
  };
}
