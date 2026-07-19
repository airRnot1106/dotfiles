{ modules, ... }:
{
  imports = with modules.home-manager.lsp; [
    kakehashi
    nixd
    version-lsp
    vscode-langservers-extracted
    vtsls
  ];
}
