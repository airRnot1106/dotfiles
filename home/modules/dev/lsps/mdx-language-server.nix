{ pkgs, ... }:
{
  home.packages = with pkgs; [ mdx-language-server ];
}
