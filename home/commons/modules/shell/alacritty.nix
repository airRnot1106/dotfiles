{ ... }:
let
  rosePineMoon = {
    base = "#232136";
    surface = "#2a273f";
    overlay = "#393552";
    muted = "#6e6a86";
    subtle = "#908caa";
    text = "#e0def4";
    love = "#eb6f92";
    gold = "#f6c177";
    rose = "#ea9a97";
    pine = "#3e8fb0";
    foam = "#9ccfd8";
    iris = "#c4a7e7";
    highlightLow = "#2a283e";
    highlightMed = "#44415a";
    highlightHigh = "#56526e";
  };
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "PlemolJP Console NF";
        };
        size = 16.0;
        offset = {
          x = 1;
          y = 1;
        };
      };
      colors = with rosePineMoon; {
        primary = {
          foreground = text;
          background = base;
          dim_foreground = subtle;
          bright_foreground = text;
        };
        cursor = {
          text = text;
          cursor = highlightHigh;
        };
        vi_mode_cursor = {
          text = text;
          cursor = highlightHigh;
        };
        search = {
          matches = {
            foreground = subtle;
            background = overlay;
          };
          focused_match = {
            foreground = base;
            background = rose;
          };
        };
        hints = {
          start = {
            foreground = subtle;
            background = surface;
          };
          end = {
            foreground = muted;
            background = surface;
          };
        };
        line_indicator = {
          foreground = "None";
          background = "None";
        };
        footer_bar = {
          foreground = text;
          background = surface;
        };
        selection = {
          text = text;
          background = highlightMed;
        };
        normal = {
          black = overlay;
          red = love;
          green = pine;
          yellow = gold;
          blue = foam;
          magenta = iris;
          cyan = rose;
          white = text;
        };
        bright = {
          black = muted;
          red = love;
          green = pine;
          yellow = gold;
          blue = foam;
          magenta = iris;
          cyan = rose;
          white = text;
        };
        dim = {
          black = muted;
          red = love;
          green = pine;
          yellow = gold;
          blue = foam;
          magenta = iris;
          cyan = rose;
          white = text;
        };
      };
    };
  };
}
