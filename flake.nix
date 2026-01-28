{
  description = "airRnot's dotfiles";

  inputs = {
    edgepkgs = {
      url = "github:natsukium/edgepkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    nixpkgs.url = "github:nixos/nixpkgs/70801e06d9730c4f1704fbd3bbf5b8e11c03a2a7";
    nur-packages = {
      url = "github:airRnot1106/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/default";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://airrnot.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "airrnot.cachix.org-1:w3kgp+iIESfezlrppODxo9Ahm1QLkCJXDhEuxYfUV7k="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
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
          ...
        }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              direnv
              git
              lua-language-server
              nixd
            ];
            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };
          pre-commit = import ./pre-commit { inherit config; };
          treefmt = import ./treefmt;
          apps = {
            update-flake = {
              type = "app";
              program = toString (
                pkgs.writeShellScript "update-flake" ''
                  set -e
                  echo "updating flake..."
                  nix flake update
                  echo "flake update complete!"
                ''
              );
            };

            update-home-manager = {
              type = "app";
              program = toString (
                pkgs.writeShellScript "update-home-manager" ''
                  set -e
                  HOST="''${1:-macbook-air-m2}"
                  echo "updating home-manager for host: $HOST..."
                  nix run nixpkgs#home-manager -- switch --flake .#"$HOST" --show-trace --impure
                  echo "home-manager update complete!"
                ''
              );
            };

            update-nix-darwin = {
              type = "app";
              program = toString (
                pkgs.writeShellScript "update-nix-darwin" ''
                  set -e
                  HOST="''${1:-macbook-air-m2}"
                  echo "updating nix-darwin for host: $HOST..."
                  sudo darwin-rebuild switch --flake .#"$HOST" --show-trace --impure
                  echo "nix-darwin update complete!"
                ''
              );
            };
          };
        };
      flake = {
        imports = [
          (import ./hosts { inherit inputs; })
        ];
      };
    };
}
