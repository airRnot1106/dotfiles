{ pkgs, ... }:
{
  home.packages = with pkgs; [ vue-language-server ];
}
