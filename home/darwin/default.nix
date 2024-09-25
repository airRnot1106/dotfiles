{ ... }:
let
  inherit (import ../options.nix)
    username
    ;
in
{
  home = {
    homeDirectory = "/Users/${username}";
  };

  imports = [
    ../commons
    ./modules
  ];
}
