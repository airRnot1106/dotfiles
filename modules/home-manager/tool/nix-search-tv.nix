{ pkgs, ... }:
let
  ns = pkgs.writeShellApplication {
    name = "ns";
    runtimeInputs = with pkgs; [
      fzf
      nix-search-tv
    ];
    text =
      builtins.replaceStrings
        [ "\"nixpkgs ctrl-n\"\n    \"home-manager ctrl-h\"" ]
        [ "\"nixpkgs ctrl-j\"\n    \"darwin ctrl-k\"\n    \"home-manager ctrl-h\"" ]
        (builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh");
  };
in
{
  home.packages = [ ns ];
}
