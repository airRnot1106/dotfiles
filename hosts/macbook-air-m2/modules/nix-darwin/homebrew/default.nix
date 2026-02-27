let
  base = ../../../../../modules/nix-darwin/homebrew;
in
{
  imports = [
    base
    ./casks
    ./masApps
  ];
}
