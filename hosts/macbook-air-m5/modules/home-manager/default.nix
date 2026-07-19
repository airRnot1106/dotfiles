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
        ./tool
      ];
    };
  };

  imports = [
    common.home-manager.default
  ];
}
