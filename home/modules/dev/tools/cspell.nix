{ pkgs, ... }:
{
  home.packages = with pkgs; [ nodePackages.cspell ];

  xdg.configFile.cspell.source = ./configs/cspell;
}
