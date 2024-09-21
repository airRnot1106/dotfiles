{ pkgs, inputs, ... }:
let
  inherit (import ../options.nix) username;
in
{
  nixpkgs = {
    # overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
    overlays = [ (import ../overlays/neovim.nix { inherit pkgs; }) ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = username;
    homeDirectory = "/home/${username}";

    sessionPath = [ "$HOME/.local/bin" ];

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";

  };

  imports = [
    ../commons/modules
    ./modules
  ];

  programs.home-manager.enable = true;
}
