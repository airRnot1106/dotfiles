{
  lib,
  stdenv,
  ...
}:
stdenv.mkDerivation rec {
  pname = "zmx";
  version = "0.4.2";
  src = fetchTarball {
    url = "https://zmx.sh/a/zmx-${version}-macos-aarch64.tar.gz";
    sha256 = "sha256:0spa64bqwiqrmsryf1bdv0sihgx2x1a3imbaawap86qv9fcnvqar";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp zmx $out/bin/
  '';

  meta = {
    description = "Session persistence for terminal processes";
    homepage = "https://github.com/neurosnap/zmx";
    license = lib.licenses.mit;
    platforms = [ "aarch64-darwin" ];
    mainProgram = "zmx";
  };
}
