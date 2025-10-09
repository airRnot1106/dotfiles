{ pkgs, ... }:
{
  home.packages = with pkgs; [ selene ];
}
