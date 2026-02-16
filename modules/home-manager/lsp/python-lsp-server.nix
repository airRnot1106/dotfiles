{ pkgs, ... }:
{
  home.packages = with pkgs; [ python314Packages.python-lsp-server ];
}
