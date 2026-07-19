{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.kakehashi.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
