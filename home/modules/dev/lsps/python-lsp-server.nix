{ pkgs, ... }:
{
  home.packages = with pkgs; [ python312Packages.python-lsp-server ];
}
