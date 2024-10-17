{ ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./configs/wezterm/wezterm.lua;
  };
}
