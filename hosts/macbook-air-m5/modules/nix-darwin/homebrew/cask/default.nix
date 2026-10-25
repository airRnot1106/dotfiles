{ modules, ... }:
{
  imports = [
    modules.nix-darwin.homebrew.cask."1password"
  ]
  ++ (with modules.nix-darwin.homebrew.cask; [
    ardia
    ghostty
    google-chrome
    kanaemi
    keepingyouawake
    keyboardcleantool
    maccy
    nani
    raycast
    steam
    symboliclinker
    thaw
    wakatime
    zoom
  ]);
}
