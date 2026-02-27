{ lib, ... }:
{
  system = {
    defaults = {
      dock = {
        autohide = lib.mkDefault true;
        autohide-delay = lib.mkDefault 0.0;
        show-recents = lib.mkDefault false;
        orientation = lib.mkDefault "bottom";
        tilesize = lib.mkDefault 20;
        magnification = lib.mkDefault true;
        largesize = lib.mkDefault 110;
        mineffect = lib.mkDefault "scale";
        mru-spaces = lib.mkDefault false;
        persistent-apps = lib.mkDefault [
          "/Applications/Arc.app"
          "/Applications/Ghostty.app"
          "/Applications/Nani.app"
          "/Applications/1Password.app"
          "/System/Applications/System\ Settings.app/"
        ];
        wvous-br-corner = lib.mkDefault 11;
      };
    };
  };
}
