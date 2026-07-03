let
  base = ../../../../../modules/home-manager/lsp;
in
{
  imports = map (f: base + "/${f}") [
    "astro-language-server.nix"
    "bash-language-server.nix"
    "copilot-language-server.nix"
    "lua-language-server.nix"
    "mdx-language-server.nix"
    "mypy.nix"
    "nixd.nix"
    "python-lsp-server.nix"
    "rustowl.nix"
    "tailwindcss-language-server.nix"
    "typescript-language-server.nix"
    "version-lsp.nix"
    "vscode-langservers-extracted.nix"
    "vtsls.nix"
    # "vue-language-server.nix" # temporarily disabled: nixpkgs build depends on pnpm-10.34.0,
    # which is marked insecure due to CVE-2026-55697. Re-enable once nixpkgs fixes the pin.
  ];
}
