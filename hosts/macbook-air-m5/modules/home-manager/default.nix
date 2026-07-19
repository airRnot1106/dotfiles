{ profile, common, ... }:
let
  inherit (profile) username;
in
{
  home-manager = {
    users.${username} = {
      imports = [
        ./core
        ./editor
        ./home
        ./language
        ./lsp
        ./tool
      ];
    };
  };

  imports = [
    common.home-manager.default
  ];
}
