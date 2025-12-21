{
  lib,
  stdenvNoCC,
  fetchurl,
  undmg,
}:

stdenvNoCC.mkDerivation {
  pname = "nani";
  version = "1.0.50";

  src = fetchurl {
    url = "https://nani-desktop.kiok.jp/artifacts/nani-mac-latest.dmg";
    sha256 = "1l8fz0aig3rrgd5z3rs04dcpyfi7ljkvh2pis95pk5844v1wcf31";
  };

  nativeBuildInputs = [ undmg ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications
    cp -r *.app $out/Applications/

    runHook postInstall
  '';

  meta = {
    description = "Nani Desktop Application";
    homepage = "https://nani-desktop.kiok.jp";
    license = lib.licenses.unfree;
    platforms = lib.platforms.darwin;
    maintainers = [ ];
  };
}
