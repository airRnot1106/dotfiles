{
  self,
  inputs,
  profile,
  common,
  modules,
  ...
}:
{
  home-manager = {
    extraSpecialArgs = {
      inherit
        self
        inputs
        profile
        common
        modules
        ;
    };
    sharedModules = [ inputs.nix-index-database.homeModules.default ];
  };
}
