final: prev: {
  deno = prev.deno.overrideAttrs (oldAttrs: rec {
    version = "2.3.4";
    src = prev.fetchFromGitHub {
      owner = "denoland";
      repo = "deno";
      rev = "v${version}";
      hash = "sha256-oGD4Qz4i2mdyyxRFZYxtT8DfX0DaFcmW9iai2kbrQPE=";
    };
    cargoDeps = prev.rustPlatform.fetchCargoVendor {
      inherit src;
      name = "deno-${version}";
      hash = "sha256-NigdetbEAgaH+CqiqJUMYUkVIOsK+zJsy4qjLVfVWSY=";
    };
    doInstallCheck = false;
    doCheck = false;
  });
}
