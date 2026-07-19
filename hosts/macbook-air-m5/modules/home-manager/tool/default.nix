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
    macskk
    mocword
    nix-search-tv
    nix-sweep
    nixfmt
    opensrc
    pnpm
    podman
    ripgrep
    skk-dictionary
    tree-sitter
    uv
    zoxide
  ];
}
