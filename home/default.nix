{ inputs, ... }:
let
  inherit (import ./options.nix)
    username
    gitUsername
    gitEmail
    ;
in
{
  nixpkgs = {
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      inputs.nix-vscode-extensions.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    homeDirectory = "/Users/${username}";

    username = username;

    sessionVariables = {
      GIT_USERNAME = gitUsername;
      GIT_EMAIL = gitEmail;
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";
  };

  imports = [
    ./modules
  ];

  programs.home-manager.enable = true;
}
