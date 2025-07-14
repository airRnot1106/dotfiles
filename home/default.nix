{ inputs, ... }:
let
  inherit (import ./options.nix)
    username
    gitUsername
    gitEmail
    openaiKey
    ;
in
{
  nixpkgs = {
    overlays = [
      (import ../nix/overlays/aicommits)
      # (import ../nix/overlays/deno)
      # (import ../nix/overlays/kdlfmt)
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
      OPENAI_KEY = openaiKey;
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";
  };

  imports = [
    ./modules
  ];

  programs.home-manager.enable = true;
}
