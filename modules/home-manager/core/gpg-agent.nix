{ pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 86400;
    maxCacheTtl = 259200;
    pinentry.package = pkgs.pinentry_mac;
    enableZshIntegration = true;
  };
  home.packages = with pkgs; [ gnupg ];
}
