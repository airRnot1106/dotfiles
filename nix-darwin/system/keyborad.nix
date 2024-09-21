{ ... }:
{
  system = {
    defaults = {
      NSGlobalDomain = {
        InitialKeyRepeat = 14;
        KeyRepeat = 1;
        AppleKeyboardUIMode = 3;
        ApplePressAndHoldEnabled = false;
        "com.apple.keyboard.fnState" = false;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };
}
