{ lib, ... }:
{
  system = {
    keyboard = {
      enableKeyMapping = lib.mkDefault true;
      remapCapsLockToControl = lib.mkDefault true;
    };
    defaults = {
      ".GlobalPreferences" = {
        "com.apple.mouse.scaling" = lib.mkDefault 16.0;
      };
      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = lib.mkDefault true;
        AppleKeyboardUIMode = lib.mkDefault 3;
        ApplePressAndHoldEnabled = lib.mkDefault false;
        InitialKeyRepeat = lib.mkDefault 14;
        KeyRepeat = lib.mkDefault 1;
        "com.apple.swipescrolldirection" = lib.mkDefault true;
        "com.apple.mouse.tapBehavior" = lib.mkDefault 1;
        "com.apple.trackpad.enableSecondaryClick" = lib.mkDefault true;
        "com.apple.trackpad.scaling" = lib.mkDefault 3.0;
        "com.apple.trackpad.trackpadCornerClickBehavior" = lib.mkDefault 1;
      };
      trackpad = {
        Clicking = lib.mkDefault true;
        Dragging = lib.mkDefault true;
        TrackpadRightClick = lib.mkDefault true;
      };
    };
  };
}
