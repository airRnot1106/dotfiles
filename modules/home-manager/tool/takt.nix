{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.nix-takt.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
