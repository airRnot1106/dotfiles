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
          # "/nix/store/v8v6agaa9q0bxvgv5348885l5vv534gm-arc-browser-1.55.0-52417/Applications/Arc.app"
          "~/.nix-profile/Applications/Arc.app"
          # "/nix/store/2790rj9mndm2h6qysik0rwasnqfzab32-vscode-1.92.0/Applications/Visual Studio Code.app"
          "~/.nix-profile/Applications/Visual Studio Code.app"
          # "/nix/store/hc0l6kmzn1vqkqx7g0s4ggisd5mcb85k-warp-terminal-0.2024.07.16.08.02.stable_03/Applications/Warp.app"
          "~/.nix-profile/Applications/Warp.app"
          "/System/Applications/System\ Settings.app/"
        ];
        wvous-bl-corner = 5;
        wvous-br-corner = 11;
      };
    };
  };
}
