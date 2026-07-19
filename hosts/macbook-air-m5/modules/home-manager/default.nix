{ profile, common, ... }:
let
  inherit (profile) username;
in
{
  home-manager = {
    users.${username} = {
      imports = [
        ./core
        ./language
      ];
    };
  };

  imports = [
    common.home-manager.default
  ];
}
