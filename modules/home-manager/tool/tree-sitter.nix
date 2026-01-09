{ pkgs, ... }:
{
  home.packages = with pkgs; [ tree-sitter ];
}
