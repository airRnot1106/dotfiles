{
  description = "airRnot's dotfiles";

  nixConfig = {
    extra-substituters = [
      "https://airrnot.cachix.org"
      "https://nix-community.cachix.org"
      "https://ryoppippi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "airrnot.cachix.org-1:w3kgp+iIESfezlrppODxo9Ahm1QLkCJXDhEuxYfUV7k="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "ryoppippi.cachix.org-1:b2LbtWNvJeL/qb1B6TYOMK+apaCps4SCbzlPRfSQIms="
    ];
  };

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    haumea = {
      url = "github:nix-community/haumea";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    kakehashi.url = "github:atusy/kakehashi";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nur-packages.url = "github:airRnot1106/nur-packages";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    version-lsp.url = "github:skanehira/version-lsp";
  };

  outputs =
    {
      self,
      flake-utils,
      git-hooks,
      home-manager,
      nix-darwin,
      nixpkgs,
      treefmt-nix,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        devShells =
          let
            inherit (self.checks.${system}.git-hooks) shellHook enabledPackages;
          in
          {
            default = pkgs.mkShell {
              inherit shellHook;
              packages =
                with pkgs;
                [
                  inputs.kakehashi.packages.${system}.default
                  nixd
                ]
                ++ enabledPackages;
            };
          };

        formatter =
          let
            treefmtEval = treefmt-nix.lib.evalModule pkgs ./nix/treefmt.nix;
          in
          treefmtEval.config.build.wrapper;

        checks = {
          git-hooks = git-hooks.lib.${system}.run (
            import ./nix/git-hooks.nix {
              inherit self pkgs;
            }
          );
        };
      }
    )
    // {
      darwinConfigurations =
        let
          inherit (nixpkgs) lib;
          inherit (inputs.haumea.lib) load loaders;

          # Since haumea represents directory modules as { default = <path>; },
          # we flatten such sets to just the path for a consistent interface.
          collapse =
            a:
            if builtins.isAttrs a then
              if a ? default && builtins.attrNames a == [ "default" ] then
                a.default # {default=path;} → path
              else
                builtins.mapAttrs (_: collapse) a
            else
              a;
          # Load common/ the same way: host-agnostic wiring each host imports directory.
          common = collapse (load {
            src = ./common;
            loader = loaders.path;
          });
          # Load the modules/ directory as a catalog for hosts to select from.
          # loaders.path treats files as paths rather than imports, mirroring the
          # directory structure as a namespace (e.g., modules.home-manager.core.git).
          modules = collapse (load {
            src = ./modules;
            loader = loaders.path;
          });

          mkDarwinHost =
            hostname:
            let
              profile = import ./hosts/${hostname}/profile.nix;
            in
            nix-darwin.lib.darwinSystem {
              specialArgs = {
                inherit
                  self
                  inputs
                  profile
                  common
                  modules
                  ;
              };
              modules = [
                home-manager.darwinModules.home-manager
                ./hosts/${hostname}
                {
                  nixpkgs = {
                    hostPlatform = profile.system;
                    config.allowUnfree = true;
                  };
                }
              ];
            };
        in
        lib.genAttrs (lib.attrNames (
          lib.filterAttrs (_: type: type == "directory") (builtins.readDir ./hosts)
        )) mkDarwinHost;
    };
}
