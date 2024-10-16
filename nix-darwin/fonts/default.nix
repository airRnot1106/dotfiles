{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      hackgen-nf-font
      nerdfonts
      plemoljp-nf
    ];
  };
}
