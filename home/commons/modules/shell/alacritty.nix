{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "PlemolJP Console NF";
        };
        size = 15.0;
        offset = {
          x = 1;
          y = 1;
        };
      };
    };
  };
}
