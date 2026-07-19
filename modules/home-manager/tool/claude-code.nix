{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.nix-claude-code.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
