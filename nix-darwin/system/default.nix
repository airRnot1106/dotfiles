{ ... }:
{
  system = {
    stateVersion = 5;
  };
  imports = [
    ./dock.nix
    ./finder.nix
    ./general.nix
    ./keyborad.nix
    ./trackpad.nix
  ];
}
