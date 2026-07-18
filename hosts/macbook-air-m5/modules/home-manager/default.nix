{
  self,
  inputs,
  profile,
  ...
}:
let
  inherit (profile) username;
in
{
  home-manager = {
    extraSpecialArgs = { inherit self inputs profile; };
    users.${username} = {
      imports = [
        ./language
      ];
    };
  };
}
