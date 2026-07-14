let
  base = ../../../../../modules/home-manager/language;
in
{
  imports = map (f: base + "/${f}") [
    "deno.nix"
    "node.nix"
  ];
}
