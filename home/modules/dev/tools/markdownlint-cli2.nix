{ pkgs, ... }:
{
  home.packages = with pkgs; [ markdownlint-cli2 ];
}
