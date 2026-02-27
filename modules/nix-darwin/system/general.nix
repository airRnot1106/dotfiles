{ lib, ... }:
{
  system = {
    defaults = {
      NSGlobalDomain = {
        AppleFontSmoothing = lib.mkDefault 2;
        AppleICUForce24HourTime = lib.mkDefault true;
        AppleInterfaceStyleSwitchesAutomatically = lib.mkDefault true;
        AppleScrollerPagingBehavior = lib.mkDefault true;
        AppleShowScrollBars = lib.mkDefault "WhenScrolling";
        NSAutomaticCapitalizationEnabled = lib.mkDefault false;
        NSAutomaticDashSubstitutionEnabled = lib.mkDefault false;
        NSAutomaticInlinePredictionEnabled = lib.mkDefault true;
        NSAutomaticQuoteSubstitutionEnabled = lib.mkDefault false;
        NSAutomaticPeriodSubstitutionEnabled = lib.mkDefault false;
        NSAutomaticSpellingCorrectionEnabled = lib.mkDefault false;
        NSDisableAutomaticTermination = lib.mkDefault true;
        NSDocumentSaveNewDocumentsToCloud = lib.mkDefault false;
        NSWindowShouldDragOnGesture = lib.mkDefault true;
      };
      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = lib.mkDefault false;
      };
      WindowManager = {
        GloballyEnabled = lib.mkDefault false;
        HideDesktop = lib.mkDefault false;
        StageManagerHideWidgets = lib.mkDefault false;
        StandardHideDesktopIcons = lib.mkDefault false;
        StandardHideWidgets = lib.mkDefault false;
      };
    };
    activationScripts.extraActivation.text = lib.mkDefault ''
      # Set StartupMute to disable boot chime
      nvram StartupMute=%01
    '';
  };
}
