{ lib, ... }:
{
  system = {
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = lib.mkDefault true;
        AppleShowAllFiles = lib.mkDefault true;
        NSTableViewDefaultSizeMode = lib.mkDefault 3;
      };
      finder = {
        AppleShowAllFiles = lib.mkDefault true;
        AppleShowAllExtensions = lib.mkDefault true;
        CreateDesktop = lib.mkDefault true;
        FXDefaultSearchScope = lib.mkDefault "SCcf";
        FXEnableExtensionChangeWarning = lib.mkDefault false;
        FXPreferredViewStyle = lib.mkDefault "clmv";
        QuitMenuItem = lib.mkDefault true;
        ShowPathbar = lib.mkDefault true;
        ShowStatusBar = lib.mkDefault true;
        _FXShowPosixPathInTitle = lib.mkDefault true;
      };
    };
  };
}
