{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "version-lsp";
  version = "unstable-2026-01-03";

  src = fetchFromGitHub {
    owner = "skanehira";
    repo = "version-lsp";
    rev = "f6a0d96d4561aa73c668bbd8656d2efe133f94f3";
    hash = "sha256-0RYzgOpvlrtA84LHGj+wxR198ghCz5RP/PSawGHgk/Y=";
  };

  cargoHash = "sha256-obTLTrElqa71DosFsdh174wrDRH5uBBGW58n6ejk9qo=";

  meta = {
    description = "A Language Server Protocol (LSP) implementation that provides version checking diagnostics for package dependency files";
    homepage = "https://github.com/skanehira/version-lsp";
    license = lib.licenses.mit;
    mainProgram = "version-lsp";
  };
}
