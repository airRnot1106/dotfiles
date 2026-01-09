let
  base = ../../../../../../modules/nix-darwin/homebrew/masApps;
in
{
  imports = map (f: base + "/${f}") [
    "amphetamine.nix"
    "flow.nix"
    "line.nix"
    "run-cat.nix"
    "yoink.nix"
  ];
}
