{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  pnpm,
  ...
}:

buildNpmPackage rec {
  pname = "aicommits";
  version = "1.11.0";

  src = fetchFromGitHub {
    owner = "nutlope";
    repo = "aicommits";
    rev = "v${version}";
    hash = "sha256-UPEkEhnZy7i/BE4XuAVfRSIanlnhK/s74+Leb+rAbAI=";
  };

  nativeBuildInputs = [
    pnpm
  ];

  postPatch = ''
    cp ${./package-lock.json} ./package-lock.json
  '';

  npmDepsHash = "sha256-x9zeEDRErNIdgCLcVWu73cmJoyREj2ARm0TxtalIw78=";

  meta = {
    description = "CLI that writes your git commit messages for you with AI";
    homepage = "https://www.npmjs.com/package/aicommits";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.matteopacini ];
    mainProgram = "aicommits";
  };

}
