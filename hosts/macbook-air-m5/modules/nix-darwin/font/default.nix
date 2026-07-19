{ modules, ... }:
{
  imports = with modules.nix-darwin.font; [
    hackgen-nf-font
    nerd-fonts
  ];
}
