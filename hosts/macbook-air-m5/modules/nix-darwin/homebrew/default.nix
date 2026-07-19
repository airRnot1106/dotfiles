{ common, ... }:
{
  imports = [
    common.nix-darwin.homebrew
    ./cask
    ./mas
  ];
}
