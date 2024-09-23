{ ... }:
{
  system.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;

  imports = [ ./nix ];
}
