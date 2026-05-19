{ lib, ... }:
{
  system = {
    defaults = {
      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = lib.mkDefault true;
        AppleKeyboardUIMode = lib.mkDefault 3;
        ApplePressAndHoldEnabled = lib.mkDefault false;
        InitialKeyRepeat = lib.mkDefault 14;
        KeyRepeat = lib.mkDefault 1;
      };
    };
    keyboard = {
      enableKeyMapping = lib.mkDefault true;
      remapCapsLockToControl = lib.mkDefault true;
    };
  };
}
