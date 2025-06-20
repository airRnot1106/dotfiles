{ pkgs, ... }:
{
  home.packages = [
    pkgs.aicommits
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
