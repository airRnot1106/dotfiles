{ pkgs, ... }:
{
  home.packages = with pkgs; [ tailwindcss-language-server ];
}
