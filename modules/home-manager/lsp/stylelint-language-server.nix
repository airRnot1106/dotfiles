{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system}.stylelint-language-server
  ];
}
