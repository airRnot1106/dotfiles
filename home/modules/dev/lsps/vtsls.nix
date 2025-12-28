{ pkgs, ... }:
{
  home.packages = with pkgs; [ vtsls ];
}
