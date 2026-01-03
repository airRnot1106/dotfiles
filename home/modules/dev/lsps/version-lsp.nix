{ pkgs, ... }:
{
  home.packages = with pkgs; [ version-lsp ];
}
