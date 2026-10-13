{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system}.css-modules-kit-ts-plugin
  ];
}
