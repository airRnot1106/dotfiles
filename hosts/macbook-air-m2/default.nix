{ profile, ... }:
let
  inherit (profile) username;
in
{
  users.users.${username}.home = "/Users/${username}";

  imports = [
    ./modules
  ];
}
