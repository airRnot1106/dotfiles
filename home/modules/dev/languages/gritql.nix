{ pkgs, ... }:
{
  home.packages = with pkgs; [ gritql ];
}
