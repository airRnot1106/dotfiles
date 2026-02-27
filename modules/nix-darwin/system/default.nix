{ lib, ... }:
{
  system = {
    stateVersion = lib.mkDefault 5;
  };
  imports = [
    ./dock.nix
    ./finder.nix
    ./general.nix
    ./keyboard.nix
    ./primary-user.nix
    ./trackpad.nix
  ];
}
