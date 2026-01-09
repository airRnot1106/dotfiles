{ pkgs, ... }:
{
  home.packages = with pkgs; [ astro-language-server ];
}
