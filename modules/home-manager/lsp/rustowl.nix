{ pkgs, ... }:
{
  home.packages = with pkgs; [ rustowl ];
}
