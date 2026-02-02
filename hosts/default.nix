{ inputs, ... }:
let
  pkgsFor =
    system:
    import inputs.nixpkgs {
      inherit system;
      overlays = [
        inputs.edgepkgs.overlays.default
        inputs.neovim-nightly-overlay.overlays.default
        inputs.nur-packages.overlays.default
        inputs.rustowl-flake.overlays.default
        (import ../modules/overlays)
      ];
      config = {
        allowUnfree = true;
      };
    };

  homeManagerConfigurationFor =
    {
      modules,
      system,
      profile,
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsFor system;
      extraSpecialArgs = {
        inherit inputs profile;
      };
      inherit modules;
    };
  darwinSystemFor =
    {
      modules,
      system,
      profile,
    }:
    inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        {
          nixpkgs.pkgs = pkgsFor system;
          _module.args = {
            inherit profile;
          };
        }
      ]
      ++ modules;
    };

  # Hosts
  macbook-air-m2 = import ./macbook-air-m2 { inherit homeManagerConfigurationFor darwinSystemFor; };
in
{
  homeConfigurations = {
    macbook-air-m2 = macbook-air-m2.homeManagerConfiguration;
  };
  darwinConfigurations = {
    macbook-air-m2 = macbook-air-m2.darwinSystem;
  };
}
