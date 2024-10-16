{ pkgs, ... }:
{
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage {
      pname = "kdlfmt";
      version = "0.0.3";
      src = pkgs.fetchFromGitHub {
        owner = "hougesen";
        repo = "kdlfmt";
        rev = "v0.0.3";
        hash = "";
      };
      cargoLock.lockFile = ./Cargo.lock;
    })
  ];
}
