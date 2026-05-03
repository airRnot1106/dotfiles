{ pkgs, ... }:
{
  home.packages = with pkgs; [ nix-takt ];
}
