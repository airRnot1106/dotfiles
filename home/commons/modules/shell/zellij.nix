{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "rose-pine-moon";
      themes = {
        rose-pine-moon = {
          bg = "#44415a";
          fg = "#e0def4";
          red = "#eb6f92";
          green = "#3e8fb0";
          blue = "#9ccfd8";
          yellow = "#f6c177";
          magenta = "#c4a7e7";
          orange = "#fe640b";
          cyan = "#ea9a97";
          black = "#393552";
          white = "#e0def4";
        };
      };
      pane_frames = false;
      keybinds = {
        "shared_except \"normal\"" = {
          "bind \"q\"" = {
            SwitchToMode = "normal";
          };
        };
        normal = {
          unbind = "Ctrl n";
        };
      };
    };
  };
}
