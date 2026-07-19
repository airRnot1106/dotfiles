{ pkgs, ... }:
{
  home.packages = with pkgs; [ opensrc ];
}
