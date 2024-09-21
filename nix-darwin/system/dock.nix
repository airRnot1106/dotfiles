{ ... }:
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
          "/Applications/Arc.app/"
          "/nix/store/2790rj9mndm2h6qysik0rwasnqfzab32-vscode-1.92.0/Applications/Visual Studio Code.app"
          "/Applications/Warp.app/"
          "/System/Applications/System\ Settings.app/"
        ];
        wvous-bl-corner = 5;
        wvous-br-corner = 11;
      };
    };
  };
}
