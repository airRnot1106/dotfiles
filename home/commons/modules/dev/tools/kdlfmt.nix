{ pkgs, ... }:
{
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage rec {
      pname = "kdlfmt";
      version = "0.0.3";
      src = pkgs.fetchFromGitHub {
        owner = "hougesen";
        repo = "kdlfmt";
        rev = "v0.0.3";
        hash = "sha256-qD1NYLHGmVRgV6pPXbvJ9NWDg/wVLWJY4hUsOLDlKh0=";
      };
      cargoLock.lockFile = "${src}/Cargo.lock";
    })
  ];
}
