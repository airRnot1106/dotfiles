{ ... }:
{
  programs.zellij = {
    enable = true;
  };

  home.file = {
    zellij = {
      source = ./configs/zellij;
      target = ".config/zellij";
    };
  };
}
