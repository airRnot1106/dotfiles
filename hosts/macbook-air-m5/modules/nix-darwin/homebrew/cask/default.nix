{ modules, ... }:
{
  imports = [
    modules.nix-darwin.homebrew.cask."1password"
  ]
  ++ (with modules.nix-darwin.homebrew.cask; [
    appcleaner
    arc
    ghostty
    google-chrome
    keepingyouawake
    keyboardcleantool
    maccy
    macskk
    nani
    raycast
    symboliclinker
    thaw
    wakatime
    zoom
  ]);
}
