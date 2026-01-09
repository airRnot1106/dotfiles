let
  base = ../../../../../modules/home-manager/core;
in
{
  imports = map (f: base + "/${f}") [
    "ghostty.nix"
    "git.nix"
    "oh-my-posh.nix"
    "zellij.nix"
    "zsh.nix"
  ];
}
