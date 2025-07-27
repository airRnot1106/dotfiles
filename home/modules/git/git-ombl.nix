{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.nur-packages.legacyPackages.${pkgs.system}.git-ombl
  ];
}
