{ ... }:
let
  inherit (import ../options.nix)
    username
    ;
in
{
  home = {
    homeDirectory = "/home/${username}";
  };

  imports = [
    ../commons
    ./modules
  ];
}
