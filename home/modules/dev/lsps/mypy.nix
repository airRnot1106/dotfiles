{ pkgs, ... }:
{
  home.packages = with pkgs; [ mypy ];
}
