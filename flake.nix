{
  description = "Minimal package definition for aarch64-linux";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      neovim-nightly-overlay,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        inherit (import ./home/options.nix) username;
        pkgs = import nixpkgs { inherit system; };
      in
      {
        formatter = pkgs.nixfmt-rfc-style;
        apps.update = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#${username} --show-trace
              echo "Updating nix-darwin..."
              nix run nix-darwin -- switch --flake .#${username} --show-trace
              echo "Update complete!"
            ''
          );
        };
        legacyPackages = {
          inherit (pkgs) home-manager;
          homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
            pkgs = pkgs;
            extraSpecialArgs = {
              inherit inputs;
            };
            modules = [
              ./home/home.nix
            ];
          };
          darwinConfigurations."${username}" = nix-darwin.lib.darwinSystem {
            system = system;
            extraSpecialArgs = {
              inherit inputs;
            };
            modules = [ ./nix-darwin ];
          };
        };
      }
    );
}
