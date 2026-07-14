{
  self,
  inputs,
  profile,
  ...
}:
let
  inherit (profile) username;
  base = ../../../../modules/nix-darwin/home-manager;
in
{
  home-manager = {
    extraSpecialArgs = { inherit self inputs profile; };
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
    base
  ];
}
