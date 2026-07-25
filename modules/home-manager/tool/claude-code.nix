{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.nix-claude-code.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  home.file.".claude/statusline-command.sh".source = pkgs.writers.writeBash "statusline-command.sh" ''
    # Claude Code status line: shows cwd, model, and Claude.ai session/weekly rate limit usage.

    input=$(cat)

    model=$(echo "$input" | jq -r '.model.display_name')
    dir=$(basename "$(echo "$input" | jq -r '.workspace.current_dir')")

    ctx_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
    five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
    five_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
    week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
    week_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

    fmt_epoch() {
      # $1 = epoch seconds, $2 = date format
      # Try BSD date (macOS) first, then fall back to GNU date (Linux).
      date -r "$1" "$2" 2>/dev/null || date -d "@$1" "$2" 2>/dev/null
    }

    five_time=""
    [ -n "$five_reset" ] && five_time=$(fmt_epoch "$five_reset" "+%H:%M")
    week_time=""
    [ -n "$week_reset" ] && week_time=$(fmt_epoch "$week_reset" "+%m/%d %H:%M")

    # Write a RunCat Neo menu-bar snapshot from the same payload, atomically.
    runcat_out="''${RUNCAT_OUT_FILE:-$HOME/.claude/runcat-usage.json}"
    runcat_tmp="''${runcat_out}.$$.tmp"
    if jq -n \
      --arg model "''${model:-Claude Code}" \
      --arg ctx "$ctx_pct" \
      --arg five "$five_pct" \
      --arg seven "$week_pct" \
      --arg five_time "$five_time" \
      --arg week_time "$week_time" \
      --arg updated "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
      '
      def round1: (. * 10 | round) / 10;
      def metric(t; v; r):
        if v == "" then empty
        else {
          title: t,
          formattedValue: (((v|tonumber|round1)|tostring) + "%" + (if r == "" then "" else (" (" + r + ")") end)),
          normalizedValue: (((v|tonumber)/100*10000|round)/10000)
        }
        end;
      {
        title: "Claude Code",
        symbol: "staroflife",
        metrics: ([{title:"Model", formattedValue:$model}] + [metric("Context";$ctx;""), metric("5h";$five;$five_time), metric("7d";$seven;$week_time)]),
        lastUpdatedDate: $updated
      }
      + (if $five != "" then {metricsBarValue: (($five|tonumber|round1|tostring) + "%" + (if $five_time == "" then "" else (" (" + $five_time + ")") end))} else {} end)
      ' >"$runcat_tmp" 2>/dev/null; then
      mv "$runcat_tmp" "$runcat_out"
    else
      rm -f "$runcat_tmp"
    fi

    DIM=$'\033[2m'
    RESET=$'\033[0m'

    output="''${dir} | ''${model}"

    if [ -n "$five_pct" ]; then
      if [ -n "$five_time" ]; then
        output="''${output} | $(printf '5h %.0f%% (reset %s)' "$five_pct" "$five_time")"
      else
        output="''${output} | $(printf '5h %.0f%%' "$five_pct")"
      fi
    fi

    if [ -n "$week_pct" ]; then
      if [ -n "$week_time" ]; then
        output="''${output} | $(printf '7d %.0f%% (reset %s)' "$week_pct" "$week_time")"
      else
        output="''${output} | $(printf '7d %.0f%%' "$week_pct")"
      fi
    fi

    printf '%s%s%s' "$DIM" "$output" "$RESET"
  '';
}
