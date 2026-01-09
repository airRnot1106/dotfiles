let
  base = ../../../../../modules/home-manager/language;
in
{
  imports = map (f: base + "/${f}") [
    "deno.nix"
    "erlang.nix"
    "gleam.nix"
    "go.nix"
    "node.nix"
    "python.nix"
  ];
}
