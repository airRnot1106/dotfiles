{ ... }:
let
  inherit (import ../../home/options.nix) username;
in
{
  system.primaryUser = username;
}
