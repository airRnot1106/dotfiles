{ common, ... }:
{
  imports = [
    common.nix-darwin.homebrew
    ./brew
    ./cask
    ./mas
  ];
}
