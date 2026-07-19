{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.version-lsp.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
