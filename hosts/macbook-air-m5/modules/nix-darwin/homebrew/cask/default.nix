{ modules, ... }:
{
  imports = [
    modules.nix-darwin.homebrew.cask."1password"
  ]
  ++ (with modules.nix-darwin.homebrew.cask; [
    arc
    ghostty
    google-chrome
    keepingyouawake
    keyboardcleantool
    maccy
    macskk
    nani
    raycast
    steam
    symboliclinker
    thaw
    wakatime
    zoom
  ]);
}
