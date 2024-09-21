{
  description = "Minimal package definition for aarch64-linux";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
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
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      formatter.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-rfc-style;
      formatter.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.nixfmt-rfc-style;
      formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-rfc-style;

      apps = {
        x86_64-linux.default = {
          type = "app";
          program = toString (
            nixpkgs.legacyPackages.x86_64-linux.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#x86_64-linux --show-trace
              echo "Update complete!"
            ''
          );
        };
        aarch64-linux.default = {
          type = "app";
          program = toString (
            nixpkgs.legacyPackages.aarch64-linux.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#aarch64-linux --show-trace
              echo "Update complete!"
            ''
          );
        };
        x86_64-darwin.default = {
          type = "app";
          program = toString (
            nixpkgs.legacyPackages.x86_64-darwin.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#x86_64-darwin --show-trace
              echo "Updating nix-darwin..."
              nix run nix-darwin -- switch --flake .#x86_64-darwin --show-trace
              echo "Update complete!"
            ''
          );
        };
        aarch64-darwin.default = {
          type = "app";
          program = toString (
            nixpkgs.legacyPackages.aarch64-darwin.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update
              echo "Updating home-manager..."
              nix run nixpkgs#home-manager -- switch --flake .#aarch64-darwin --show-trace
              echo "Updating nix-darwin..."
              nix run nix-darwin -- switch --flake .#aarch64-darwin --show-trace
              echo "Update complete!"
            ''
          );
        };
      };

      homeConfigurations = {
        x86_64-linux = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [ ./home/linux ];
        };
        aarch64-linux = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-linux;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [ ./home/linux ];
        };
        x86_64-darwin = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-darwin;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [ ./home/darwin ];
        };
        aarch64-darwin = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [ ./home/darwin ];
        };
      };

      darwinConfigurations = {
        x86_64-darwin = nix-darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          modules = [ ./nix-darwin ];
        };
        aarch64-darwin = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [ ./nix-darwin ];
        };
      };
    };
}
