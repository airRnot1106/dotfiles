{ pkgs, ... }:
{
  imports = [
    ./fonts
    ./nix
    ./security
    ./services
    ./system
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    casks = [
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
      "appcleaner"
      "arc"
      "discord"
      "google-japanese-ime"
      "hiddenbar"
      "keyboardcleantool"
      "orbstack"
      "raycast"
      "symboliclinker"
      "visual-studio-code"
      "warp"
      "zoom"
    ];
  };
}
