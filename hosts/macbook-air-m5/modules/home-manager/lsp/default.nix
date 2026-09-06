{ modules, ... }:
{
  imports = with modules.home-manager.lsp; [
    nixd
    version-lsp
    vscode-langservers-extracted
    vtsls
  ];
}
