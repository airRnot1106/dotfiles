{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'frappe'";
      }
    ];
  };
}
