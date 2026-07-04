{ pkgs, ... }:
{
  home.packages = [
    (pkgs.pnpm_11.override { nodejs-slim = pkgs.nodejs-slim_latest; }) # workaround for https://github.com/NixOS/nixpkgs/issues/525627
  ];
}
