let
  base = ../../../../../modules/home-manager/core;
in
{
  imports = map (f: base + "/${f}") [
    "ghostty"
    "git.nix"
    "oh-my-posh.nix"
    "zellij"
    "zsh.nix"
  ];
}
