let
  base = ../../../../../modules/nix-darwin/homebrew/casks;
in
{
  imports = map (f: base + "/${f}") [
    "1password.nix"
    "affinity.nix"
    "appcleaner.nix"
    "arc.nix"
    "claude.nix"
    "discord.nix"
    "ghostty.nix"
    "google-chrome.nix"
    "karabiner-elements.nix"
    "keyboardcleantool.nix"
    "maccy.nix"
    "macskk.nix"
    "nani.nix"
    "raycast.nix"
    "symboliclinker.nix"
    "thaw.nix"
    "wakatime.nix"
  ];
}
