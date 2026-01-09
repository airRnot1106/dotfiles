let
  base = ../../../../../modules/nix-darwin/fonts;
in
{
  imports = map (f: base + "/${f}") [
    "hackgen-nf-font.nix"
    "nerd-fonts.nix"
    "plemoljp-nf.nix"
  ];
}
