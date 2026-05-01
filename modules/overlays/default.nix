{ inputs }:
_final: prev: {
  deno =
    (import inputs.nixpkgs-deno {
      inherit (prev.stdenv.hostPlatform) system;
    }).deno;
}
