let
  inherit (import ../../profile.nix)
    username
    ;
in
{
  system.primaryUser = username;
}
