{ pkgs, ... }:
{
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };
  services.nix-daemon.enable = true;

  system = {
    stateVersion = 5;
    defaults = {
      NSGlobalDomain.AppleShowAllExtensions = true;
      NSGlobalDomain.AppleShowAllFiles = true;
      NSGlobalDomain.AppleShowScrollBars = "Automatic";
      NSGlobalDomain.AppleInterfaceStyleSwitchesAutomatically = true;
      NSGlobalDomain.InitialKeyRepeat = 0;
      NSGlobalDomain.KeyRepeat = 0;
      NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
      NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
      NSGlobalDomain.NSAutomaticInlinePredictionEnabled = false;
      NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
      NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
      NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
      NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;
      NSGlobalDomain."com.apple.keyboard.fnState" = true;
      NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
      NSGlobalDomain."com.apple.trackpad.enableSecondaryClick" = true;
      NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;
      NSGlobalDomain."com.apple.trackpad.trackpadCornerClickBehavior" = 1;
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
      WindowManager.EnableStandardClickToShowDesktop = false;
      WindowManager.GloballyEnabled = true;
      ".GlobalPreferences" = {
        "com.apple.mouse.scaling" = 2.0;
      };
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        CreateDesktop = true;
        FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
        ShowStatusBar = true;
        QuitMenuItem = true;
      };
      dock = {
        autohide = true;
        show-recents = false;
        orientation = "bottom";
        tilesize = 50;
        magnification = true;
        largesize = 128;
        mineffect = "scale";
        mru-spaces = false;
        persistent-apps = [
          "/Applications/Arc.app/"
          "/Applications/Warp.app/"
          "/System/Applications/System\ Settings.app/"
        ];
        wvous-bl-corner = 5;
        wvous-br-corner = 11;
      };
      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadRightClick = true;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  fonts = {
    packages = with pkgs; [
      nerdfonts
    ];
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    casks = [
      "arc"
      "warp"
    ];
  };
}
