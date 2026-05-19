{ pkgs, lib, ... }:
{
  nix = {
    optimise.automatic = lib.mkDefault true;
    settings = {
      experimental-features = lib.mkDefault "nix-command flakes";
      extra-substituters = lib.mkDefault [
        "https://airrnot.cachix.org"
        "https://nix-community.cachix.org"
        "https://ryoppippi.cachix.org"
      ];
      extra-trusted-public-keys = lib.mkDefault [
        "airrnot.cachix.org-1:w3kgp+iIESfezlrppODxo9Ahm1QLkCJXDhEuxYfUV7k="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "ryoppippi.cachix.org-1:b2LbtWNvJeL/qb1B6TYOMK+apaCps4SCbzlPRfSQIms="
      ];
      max-jobs = lib.mkDefault 8;
      trusted-users = [
        "root"
        "@wheel"
      ]
      ++ lib.optional pkgs.stdenv.isDarwin "@admin";
    };
  };
  programs.nix-index.enable = true;
  programs.nix-index-database.comma.enable = true;
}
