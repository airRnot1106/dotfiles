{ lib, ... }:
{
  system.defaults = {
    dock = {
      autohide = lib.mkDefault true;
      autohide-delay = lib.mkDefault 0.0;
      largesize = lib.mkDefault 110;
      magnification = lib.mkDefault true;
      mineffect = lib.mkDefault "scale";
      mru-spaces = lib.mkDefault false;
      orientation = lib.mkDefault "bottom";
      persistent-apps = lib.mkDefault [
        "/Applications/Arc.app"
        "/Applications/Ghostty.app"
        "/Applications/1Password.app"
        "/System/Applications/System\ Settings.app/"
      ];
      show-recents = lib.mkDefault false;
      tilesize = lib.mkDefault 20;
      wvous-br-corner = lib.mkDefault 11;
    };
    finder = {
      AppleShowAllExtensions = lib.mkDefault true;
      AppleShowAllFiles = lib.mkDefault true;
      CreateDesktop = lib.mkDefault true;
      FXDefaultSearchScope = lib.mkDefault "SCcf";
      FXEnableExtensionChangeWarning = lib.mkDefault false;
      FXPreferredViewStyle = lib.mkDefault "clmv";
      QuitMenuItem = lib.mkDefault true;
      ShowPathbar = lib.mkDefault true;
      ShowStatusBar = lib.mkDefault true;
      _FXShowPosixPathInTitle = lib.mkDefault true;
    };
    NSGlobalDomain = {
      AppleShowAllExtensions = lib.mkDefault true;
      AppleShowAllFiles = lib.mkDefault true;
      NSTableViewDefaultSizeMode = lib.mkDefault 3;
      AppleFontSmoothing = lib.mkDefault 2;
      AppleICUForce24HourTime = lib.mkDefault true;
      AppleInterfaceStyleSwitchesAutomatically = lib.mkDefault true;
      AppleScrollerPagingBehavior = lib.mkDefault true;
      AppleShowScrollBars = lib.mkDefault "WhenScrolling";
      NSAutomaticCapitalizationEnabled = lib.mkDefault false;
      NSAutomaticDashSubstitutionEnabled = lib.mkDefault false;
      NSAutomaticInlinePredictionEnabled = lib.mkDefault true;
      NSAutomaticPeriodSubstitutionEnabled = lib.mkDefault false;
      NSAutomaticQuoteSubstitutionEnabled = lib.mkDefault false;
      NSAutomaticSpellingCorrectionEnabled = lib.mkDefault false;
      NSDisableAutomaticTermination = lib.mkDefault true;
      NSDocumentSaveNewDocumentsToCloud = lib.mkDefault false;
      NSWindowShouldDragOnGesture = lib.mkDefault true;
    };
    WindowManager = {
      GloballyEnabled = lib.mkDefault false;
      HideDesktop = lib.mkDefault false;
      StageManagerHideWidgets = lib.mkDefault false;
      StandardHideDesktopIcons = lib.mkDefault false;
      StandardHideWidgets = lib.mkDefault false;
    };
  };
}
