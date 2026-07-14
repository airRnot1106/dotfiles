{
  description = "airRnot's dotfiles";

  inputs = {
    agent-skills.url = "path:./modules/agent-skills";
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    mocword.url = "github:blyoa/nix-mocword";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-claude-code.url = "github:ryoppippi/nix-claude-code";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nur-packages.url = "github:airRnot1106/nur-packages";
    rustowl-flake.url = "github:nix-community/rustowl-flake";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nur-packages,
      git-hooks,
      nix-index-database,
      treefmt-nix,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      mkDarwinHost =
        {
          system,
          profile,
          modules,
        }:
        nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit self inputs profile;
          };
          modules = [
            {
              nixpkgs = {
                hostPlatform = system;
                overlays = [ nur-packages.overlays.default ];
                config.allowUnfree = true;
              };
            }
            home-manager.darwinModules.home-manager
            nix-index-database.darwinModules.nix-index
          ]
          ++ modules;
        };
    in
    {
      apps = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          hosts = lib.attrNames self.darwinConfigurations;
        in
        {
          build-darwin = {
            type = "app";
            program = "${pkgs.writeShellScript "build-darwin" ''
              host=$(printf '%s\n' ${lib.escapeShellArgs hosts} | ${lib.getExe pkgs.fzf} --prompt='host> ')
              [ -z "$host" ] && exit 1
              ${lib.getExe pkgs.nix-output-monitor} build ".#darwinConfigurations.$host.system"
            ''}";
          };
          switch-darwin = {
            type = "app";
            program = "${pkgs.writeShellScript "switch-darwin" ''
              host=$(printf '%s\n' ${lib.escapeShellArgs hosts} | ${lib.getExe pkgs.fzf} --prompt='host> ')
              [ -z "$host" ] && exit 1
              sudo darwin-rebuild switch --flake ".#$host" --show-trace
            ''}";
          };
        }
      );
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          inherit (self.checks.${system}.pre-commit) shellHook enabledPackages;
        in
        {
          default = pkgs.mkShellNoCC {
            inherit shellHook;
            packages = enabledPackages;
          };
        }
      );
      formatter = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        in
        treefmtEval.config.build.wrapper
      );
      checks = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          pre-commit = git-hooks.lib.${system}.run (
            import ./pre-commit.nix {
              inherit self pkgs;
            }
          );
        }
      );
      darwinConfigurations = {
        macbook-air-m2 = mkDarwinHost {
          system = "aarch64-darwin";
          profile = import ./hosts/macbook-air-m2/profile.nix;
          modules = [ ./hosts/macbook-air-m2 ];
        };
        macbook-air-m5 = mkDarwinHost {
          system = "aarch64-darwin";
          profile = import ./hosts/macbook-air-m5/profile.nix;
          modules = [ ./hosts/macbook-air-m5 ];
        };
      };
    };
}
