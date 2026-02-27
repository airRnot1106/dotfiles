{ lib, ... }:
{
  system = {
    defaults = {
      ".GlobalPreferences" = {
        "com.apple.mouse.scaling" = lib.mkDefault 16.0;
      };
      NSGlobalDomain = {
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
