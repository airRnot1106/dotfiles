{
  stdenv,
  lib,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "gritql";
  version = "0.1.0-alpha.1743007075";

  src = fetchTarball {
    url = "https://github.com/getgrit/gritql/releases/download/v${finalAttrs.version}/grit-aarch64-apple-darwin.tar.gz";
    sha256 = "0g3m2fyyhpwaqq3lgx06fqfm6ykr88qlpbngl94blqrv9spy0p54";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp grit $out/bin/grit
  '';

  meta = {
    description = "Query language for searching, linting, and modifying code";
    homepage = "https://github.com/honeycombio/gritql";
    license = lib.licenses.mit;
    mainProgram = "grit";
  };
})
