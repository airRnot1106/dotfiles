{ pkgs, ... }:
{
  home.packages = with pkgs; [ pkgs.nodePackages.bash-language-server ];
}
