{ pkgs, ... }:
{
  home.packages = with pkgs; [ blake ];
}
