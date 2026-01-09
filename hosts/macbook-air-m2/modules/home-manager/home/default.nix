let
  base = ../../../../../modules/home-manager/home;
in
{
  imports = map (f: base + "/${f}") [
    "default.nix"
  ];
}
