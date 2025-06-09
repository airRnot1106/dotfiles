{ pkgs, ... }:
{
  home.packages = with pkgs; [ luajitPackages.luacheck ];
}
