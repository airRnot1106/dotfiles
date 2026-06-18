let
  base = ../../../../modules/nix-darwin/services;
in
{
  imports = map (f: base + "/${f}") [
    "tailscale.nix"
  ];
}
