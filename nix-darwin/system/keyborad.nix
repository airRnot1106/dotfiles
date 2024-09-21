{ ... }:
{
  system = {
    defaults = {
      NSGlobalDomain = {
        InitialKeyRepeat = 14;
        KeyRepeat = 1;
        AppleKeyboardUIMode = true;
        ApplePressAndHoldEnabled = false;
        com.apple.keyboard.fnState = true;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
