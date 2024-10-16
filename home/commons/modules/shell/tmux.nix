{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    # see: https://github.com/nix-community/home-manager/issues/5952
    package = pkgs.tmux.overrideAttrs (old: rec {
      version = "3.5";
      src = pkgs.fetchFromGitHub {
        owner = "tmux";
        repo = "tmux";
        rev = version;
        hash = "sha256-8CRZj7UyBhuB5QO27Y+tHG62S/eGxPOHWrwvh1aBqq0=";
      };
    });
    aggressiveResize = true;
    clock24 = true;
    escapeTime = 0;
    historyLimit = 30000;
    newSession = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    extraConfig = ''
      # update the env when attaching to an existing session
      set -g update-environment -r

      set -ag terminal-overrides ",alacritty*:Tc,foot*:Tc,xterm-kitty*:Tc,xterm-256color:Tc"
    '';
  };
}
