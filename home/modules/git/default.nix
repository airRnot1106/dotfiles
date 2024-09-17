{ pkgs, ... }:
{
  imports = [
    ./aicommits.nix
    ./git.nix
    ./lazygit.nix
  ];
}
