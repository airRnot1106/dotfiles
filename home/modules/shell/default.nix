{ pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./oh-my-posh.nix
    ./zsh.nix
  ];
}
