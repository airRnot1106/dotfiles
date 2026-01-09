let
  base = ../../../../../modules/nix-darwin/launchd;
in
{
  imports = map (f: base + "/${f}") [
    "yaskkserv2.nix"
  ];
}
