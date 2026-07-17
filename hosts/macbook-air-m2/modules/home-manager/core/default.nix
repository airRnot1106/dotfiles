let
  base = ../../../../../modules/home-manager/core;
in
{
  imports = map (f: base + "/${f}") [
    "ghostty"
    "git.nix"
    "gpg.nix"
    "oh-my-posh.nix"
    "zsh"
  ];
}
