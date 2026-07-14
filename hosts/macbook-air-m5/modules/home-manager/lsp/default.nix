let
  base = ../../../../../modules/home-manager/lsp;
in
{
  imports = map (f: base + "/${f}") [
    "bash-language-server.nix"
    "lua-language-server.nix"
    "nixd.nix"
    "typescript-language-server.nix"
    "version-lsp.nix"
    "vscode-langservers-extracted.nix"
    "vtsls.nix"
  ];
}
