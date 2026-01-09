{ pkgs, ... }:
{
  home.packages = with pkgs; [ kdlfmt ];
}
