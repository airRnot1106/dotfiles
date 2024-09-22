{ inputs, ... }:
# { pkgs, inputs, ... }:
let
  inherit (import ../options.nix) username gitUsername gitEmail;
in
{
  nixpkgs = {
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      inputs.nix-vscode-extensions.overlays.default
    ];
    # overlays = [ (import ../overlays/neovim.nix { inherit pkgs; }) ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      GIT_USERNAME = gitUsername;
      GIT_EMAIL = gitEmail;
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";

  };

  imports = [
    ../commons/modules
    ./modules
  ];

  programs.home-manager.enable = true;
}
