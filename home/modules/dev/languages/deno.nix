{ pkgs, ... }:
let
  deno-2-3-4 = pkgs.deno.overrideAttrs (oldAttrs: rec {
    version = "2.3.4";
    src = pkgs.fetchFromGitHub {
      owner = "denoland";
      repo = "deno";
      rev = "v${version}";
      hash = "sha256-oGD4Qz4i2mdyyxRFZYxtT8DfX0DaFcmW9iai2kbrQPE=";
    };
    cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
      inherit src;
      name = "deno-${version}";
      hash = "sha256-NigdetbEAgaH+CqiqJUMYUkVIOsK+zJsy4qjLVfVWSY=";
    };
    doInstallCheck = false;
    doCheck = false;
  });
in
{
  home.packages = [ deno-2-3-4 ];
}
