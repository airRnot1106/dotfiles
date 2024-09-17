{ pkgs, ... }:
{
  imports = [
    ./bottom.nix
    ./curl.nix
    ./era.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./genact.nix
    ./tree.nix
    ./unzip.nix
    ./wget.nix
  ];
}
