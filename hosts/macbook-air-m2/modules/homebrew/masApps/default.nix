let
  base = ../../../../../modules/nix-darwin/homebrew/masApps;
in
{
  imports = map (f: base + "/${f}") [
    "line.nix"
    "run-cat-neo.nix"
    "yoink.nix"
  ];
}
