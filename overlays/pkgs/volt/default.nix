{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule {
  pname = "volt";
  version = "unstable-2025-12-23";

  src = fetchFromGitHub {
    owner = "owenHochwald";
    repo = "volt";
    rev = "295483da2fb24b8ea3654af4c77f24c635f9f78d";
    hash = "sha256-3IUtr7WgJwiCs7Gg67hBibadzDZ6Ks8giNUiynox//o=";
  };

  vendorHash = "sha256-NEWoBsPbLzrd/oIn/1CX7JmDB5pPpSPRi1Df0OUqEMI=";

  doCheck = false;

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "High-performance, concurrent, terminal-based HTTP client";
    homepage = "https://github.com/owenHochwald/volt";
    license = lib.licenses.mpl20;
    mainProgram = "volt";
  };
}
