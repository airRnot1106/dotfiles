{ pkgs, ... }:
{
  home.packages = with pkgs; [ nix-update ];
}
