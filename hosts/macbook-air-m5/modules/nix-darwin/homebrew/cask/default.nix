{ modules, ... }:
{
  imports = [
    modules.nix-darwin.homebrew.cask."1password"
  ]
  ++ (with modules.nix-darwin.homebrew.cask; [
    ghostty
    google-chrome
    kanaemi
    keepingyouawake
    keyboardcleantool
    maccy
    nani
    phi
    raycast
    steam
    symboliclinker
    thaw
    wakatime
    zoom
  ]);
}
