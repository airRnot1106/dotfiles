{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.mocword.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
