{
  inputs,
  profile,
  ...
}:
let
  pkgsFor =
    system:
    import inputs.nixpkgs {
      inherit system;
      overlays = [
        inputs.edgepkgs.overlays.default
        inputs.neovim-nightly-overlay.overlays.default
        inputs.nur-packages.overlays.default
        (import ../../modules/overlays)
      ];
      config = {
        allowUnfree = true;
      };
    };
  system = "aarch64-darwin";
in
{
  homeConfigurations = {
    macbook-air-m2 = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsFor system;
      extraSpecialArgs = {
        inherit inputs profile;
      };
      modules = [
        ./modules/home-manager
      ];
    };
  };
  darwinConfigurations = {
    macbook-air-m2 = inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        {
          nixpkgs.pkgs = pkgsFor system;
          _module.args = {
            inherit profile;
          };
        }
        ./modules/nix-darwin
      ];
    };
  };
}
