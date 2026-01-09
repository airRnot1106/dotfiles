{
  homeManagerConfigurationFor,
  darwinSystemFor,
  ...
}:
let
  system = "aarch64-darwin";
  profile = import ./profile.nix;
in
{
  homeManagerConfiguration = homeManagerConfigurationFor {
    modules = [ ./modules/home-manager ];
    inherit system profile;
  };
  darwinSystem = darwinSystemFor {
    modules = [ ./modules/nix-darwin ];
    inherit system profile;
  };
}
