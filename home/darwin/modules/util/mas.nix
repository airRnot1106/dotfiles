{ pkgs, ... }:
{
  home.packages = with pkgs; [ mas ];
}
