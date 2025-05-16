{ pkgs, ... }:
{
  home.packages = with pkgs; [ efm-langserver ];
}
