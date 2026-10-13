{ modules, ... }:
{
  imports = with modules.home-manager.lsp; [
    css-modules-kit-ts-plugin
    nixd
    stylelint-language-server
    version-lsp
    vscode-langservers-extracted
    vtsls
  ];
}
