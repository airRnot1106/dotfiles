{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    package = pkgs.direnv.overrideAttrs {
      doCheck = !pkgs.stdenv.hostPlatform.isDarwin;
    };
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
