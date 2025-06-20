let
  inherit (import ../../home/options.nix) username;
in
{
  system = {
    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        show-recents = false;
        orientation = "bottom";
        tilesize = 20;
        magnification = true;
        largesize = 110;
        mineffect = "scale";
        mru-spaces = false;
        persistent-apps = [
          "/Applications/Arc.app"
          "/Users/${username}/.nix-profile/Applications/Visual Studio Code.app"
          "/Applications/WezTerm.app"
          "/System/Applications/System\ Settings.app/"
        ];
        wvous-bl-corner = 5;
        wvous-br-corner = 11;
      };
    };
  };
}
