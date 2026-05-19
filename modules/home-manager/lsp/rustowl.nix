{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.rustowl-flake.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
