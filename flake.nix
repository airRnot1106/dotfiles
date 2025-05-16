{
  description = "airRnot's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      treefmt-nix,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        treefmt = treefmt-nix.lib.mkWrapper pkgs {
          projectRootFile = "flake.nix";
          programs = {
            nixfmt.enable = true;
          };
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            direnv
            git
            treefmt
          ];
        };
        formatter = treefmt;
        checks.formatting = treefmt-nix.lib.mkCheck pkgs {
          inherit treefmt;
          projectRoot = self;
        };
      }
    );
}
