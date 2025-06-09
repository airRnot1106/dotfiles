{ ... }:
{
  imports = [
    ./claude-code.nix
    ./cmake.nix
    ./cspell.nix
    ./direnv.nix
    ./docker.nix
    ./gcc.nix
    ./kdlfmt.nix
    ./luacheck.nix
    ./pnpm.nix
    ./stylua.nix
    ./tree-sitter.nix
  ];
}
