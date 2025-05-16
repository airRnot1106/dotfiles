{ pkgs, ... }:
let
  aicommits = pkgs.callPackage ./pkgs/aicommits/package.nix { };
in
{
  home.packages = [
    aicommits
  ];

  home.file.".aicommits" = {
    text =
      let
        inherit (import ../../options.nix) openaiKey;
      in
      ''
        OPENAI_KEY=${openaiKey}
        type=conventional
        model=gpt-4.1-nano
      '';
  };
}
