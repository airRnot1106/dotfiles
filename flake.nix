{
  description = "airRnot's dotfiles";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur-packages = {
      url = "github:airRnot1106/nur-packages";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };
    systems.url = "github:nix-systems/default";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.git-hooks.flakeModule
        inputs.home-manager.flakeModules.home-manager
        inputs.treefmt-nix.flakeModule
      ];
      systems = import inputs.systems;

      perSystem =
        {
          config,
          pkgs,
          system,
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              direnv
              git
              lua-language-server
              nil
            ];
            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };
          pre-commit = import ./nix/pre-commit { inherit config; };
          treefmt = import ./nix/treefmt;
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
                sudo darwin-rebuild switch --flake .#personal --show-trace --impure
                echo "Update complete!"
              ''
            );
          };
        };
      flake = {
        homeConfigurations = {
          personal = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = import inputs.nixpkgs {
              system = "aarch64-darwin";
            };
            extraSpecialArgs = { inherit inputs; };
            modules = [
              ./home
            ];
          };
        };

        darwinConfigurations = {
          personal = inputs.nix-darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
              ./nix-darwin
            ];
          };
        };
      };
    };
}
