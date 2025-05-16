{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      hackgen-nf-font
      nerd-fonts.hack
      plemoljp-nf
    ];
  };
}
