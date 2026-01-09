{ pkgs, ... }:
{
  home.packages = with pkgs; [
    era
  ];
}
