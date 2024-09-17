{ pkgs, ... }:
{
  imports = [
    ./cmake.nix
    ./docker.nix
    ./gcc.nix
    ./pnpm.nix
    ./stylua.nix
  ];
}
