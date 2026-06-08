{ lib, ... }:
{
  system = {
    defaults = {
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
    };
  };
}
