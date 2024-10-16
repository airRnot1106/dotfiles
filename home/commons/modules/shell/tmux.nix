{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    # see: https://github.com/nix-community/home-manager/issues/5952
    package = pkgs.tmux.overrideAttrs (old: rec {
      version = "3.5";
      src = pkgs.fetchFromGitHub {
        owner = "tmux";
        repo = "tmux";
        rev = version;
        hash = "sha256-8CRZj7UyBhuB5QO27Y+tHG62S/eGxPOHWrwvh1aBqq0=";
      };
    });
  };
}
