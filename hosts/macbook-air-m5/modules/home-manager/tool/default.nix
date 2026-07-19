{ modules, ... }:
{
  imports = with modules.home-manager.tool; [
    claude-code
    comma
    direnv
    fd
    fzf
    gh
    ghq
    lazygit
    mocword
    nix-search-tv
    nix-sweep
    nixfmt
    opensrc
    pnpm
    podman
    ripgrep
    tree-sitter
    uv
    zoxide
  ];
}
