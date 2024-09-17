{ pkgs, ... }:
{
  imports = [
    ./bash-language-server.nix
    ./efm-langserver.nix
    ./lua-language-server.nix
  ];
}
