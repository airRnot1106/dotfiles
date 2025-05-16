{ pkgs, ... }:
{
  home.packages = with pkgs; [ genact ];
}
