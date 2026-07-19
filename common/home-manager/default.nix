{
  self,
  inputs,
  profile,
  modules,
  common,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        self
        inputs
        profile
        modules
        common
        ;
    };
    sharedModules = [ inputs.nix-index-database.homeModules.default ];
  };
}
