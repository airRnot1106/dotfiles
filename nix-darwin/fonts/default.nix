{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerdfonts
      plemoljp-nf
    ];
  };
}
