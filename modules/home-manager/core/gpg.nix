{ pkgs, ... }:
{
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 86400;
    maxCacheTtl = 259200;
    pinentry.package = pkgs.pinentry_mac;
    enableZshIntegration = true;
  };
}
