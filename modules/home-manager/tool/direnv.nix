{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    package = pkgs.direnv.overrideAttrs {
      doCheck = false;
    };
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
