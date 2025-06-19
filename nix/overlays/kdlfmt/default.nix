final: prev: {
  kdlfmt = prev.kdlfmt.overrideAttrs (oldAttrs: rec {
    version = "0.1.2";
    src = prev.fetchFromGitHub {
      owner = "hougesen";
      repo = "kdlfmt";
      rev = "v${version}";
      hash = "sha256-xDv93cxCEaBybexleyTtcCCKHy2OL3z/BG2gJ7uqIrU=";
    };
    cargoDeps = prev.rustPlatform.importCargoLock {
      lockFile = "${src}/Cargo.lock";
    };
  });
}
