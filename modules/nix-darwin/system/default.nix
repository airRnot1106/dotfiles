{ self, ... }:
{
  system = {
    stateVersion = 7;
    configurationRevision = self.rev or self.dirtyRev or null;
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
