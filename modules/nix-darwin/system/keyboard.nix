{ lib, ... }:
{
  system = {
    defaults = {
      NSGlobalDomain = {
        InitialKeyRepeat = lib.mkDefault 14;
        KeyRepeat = lib.mkDefault 1;
        AppleKeyboardUIMode = lib.mkDefault 3;
        ApplePressAndHoldEnabled = lib.mkDefault false;
        "com.apple.keyboard.fnState" = lib.mkDefault true;
      };
    };
    keyboard = {
      enableKeyMapping = lib.mkDefault true;
      remapCapsLockToControl = lib.mkDefault true;
    };
  };
}
