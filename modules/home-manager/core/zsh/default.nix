{ config, lib, ... }:
let
  ZENO_HOME = "${config.xdg.configHome}/zeno";
in
{
  programs.zsh = {
    enable = true;
    initContent = lib.mkAfter ''
      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey '^x^e' edit-command-line

      if [[ -n $ZENO_LOADED ]]; then
        bindkey ' '    zeno-auto-snippet
        bindkey '^m'   zeno-auto-snippet-and-accept-line
        bindkey '^i'   zeno-completion
        bindkey '^x^x' zeno-insert-snippet
        bindkey '^x '  zeno-insert-space
        bindkey '^x^m' accept-line
        bindkey '^x^z' zeno-toggle-auto-snippet
        bindkey '^x^p' zeno-preprompt
        bindkey '^x^s' zeno-preprompt-snippet
        bindkey '^r'   zeno-smart-history-selection
      fi
    '';
    sessionVariables = {
      inherit ZENO_HOME;
    };
  };
  programs.sheldon = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile.sheldon.source = ./configs/sheldon;
  xdg.configFile.zeno.source = ./configs/zeno;
}
