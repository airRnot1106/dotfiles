{
  description = "airRnot's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
      home-manager,
      nix-darwin,
      neovim-nightly-overlay,
      nix-vscode-extensions,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        treefmt = (treefmt-nix.lib.evalModule pkgs ./treefmt.nix).config.build;
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            direnv
            git
            treefmt.wrapper
          ];
        };
        formatter = treefmt.wrapper;
        checks.formatting = treefmt.check self;
        apps.default = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#personal --show-trace --impure
              echo "Updating nix-darwin..."
              darwin-rebuild switch --flake .#personal --show-trace --impure
              echo "Update complete!"
            ''
          );
        };
        legacyPackages = {
          inherit (pkgs) home-manager;
          homeConfigurations = {
            personal = home-manager.lib.homeManagerConfiguration {
              pkgs = pkgs;
              extraSpecialArgs = { inherit inputs; };
              modules = [
                ./home
              ];
            };
          };
          darwinConfigurations = {
            personal = nix-darwin.lib.darwinSystem {
              system = system;
              modules = [ ./nix-darwin ];
            };
          };
        };
      }
    );
}
