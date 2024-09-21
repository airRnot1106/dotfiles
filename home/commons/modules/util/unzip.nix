{ pkgs, ... }:
{
  home.packages = with pkgs; [ unzipNLS ];
}
