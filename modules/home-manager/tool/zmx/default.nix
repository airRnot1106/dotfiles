{ pkgs, ... }:
let
  zmx = pkgs.callPackage ./package { };
in
{
  home.packages = [ zmx ];
}
