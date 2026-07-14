let
  base = ../../../../../modules/home-manager/editor;
in
{
  imports = map (f: base + "/${f}") [
    "neovim.nix"
  ];
}
