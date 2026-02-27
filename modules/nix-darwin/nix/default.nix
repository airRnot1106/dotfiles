{ pkgs, lib, ... }:
{
  nix = {
    optimise.automatic = lib.mkDefault true;
    settings = {
      experimental-features = lib.mkDefault "nix-command flakes";
      max-jobs = lib.mkDefault 8;

      extra-substituters = lib.mkDefault [
        "https://airrnot.cachix.org"
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = lib.mkDefault [
        "airrnot.cachix.org-1:w3kgp+iIESfezlrppODxo9Ahm1QLkCJXDhEuxYfUV7k="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = lib.mkDefault (
        [
          "root"
          "@wheel"
        ]
        ++ lib.optional pkgs.stdenv.isDarwin "@admin"
      );
    };
  };
}
