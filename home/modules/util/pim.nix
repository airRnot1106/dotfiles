{
  pkgs,
  ...
}:
let
  pim = pkgs.rustPlatform.buildRustPackage rec {
    pname = "pim";
    version = "0.1.1";

    src = pkgs.fetchFromGitHub {
      owner = "airRnot1106";
      repo = "pim";
      rev = "v${version}";
      hash = "sha256-cudN5lB0jLgG21cYAearbWylJ1N0vlX82Z6N6LRTt7U=";
    };

    useFetchCargoVendor = true;
    cargoHash = "sha256-CfNRB8AfitOP6RwR5bZQq3a64jRWeYDZMV3Yjwlfcy8=";
  };
in
{
  home.packages = [ pim ];
}
