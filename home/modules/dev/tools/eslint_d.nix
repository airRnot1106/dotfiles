{ pkgs, ... }:
{
  home.packages = with pkgs; [ eslint_d ];
}
