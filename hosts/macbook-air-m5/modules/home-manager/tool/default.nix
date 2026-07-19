{ modules, ... }:
{
  imports = with modules.home-manager.tool; [
    claude-code
    comma
    cspell
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
