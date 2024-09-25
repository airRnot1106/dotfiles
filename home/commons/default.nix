{ inputs, ... }:
# { pkgs, inputs, ...}:
let
  inherit (import ../options.nix)
    username
    gitUsername
    gitEmail
    openaiKey
    ;
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

    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      GIT_USERNAME = gitUsername;
      GIT_EMAIL = gitEmail;
      OPENAI_KEY = openaiKey;
    };

    shellAliases = {
      ccd = "chezmoi cd";
      ced = "chezmoi edit";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";

  };

  imports = [
    ./modules
  ];

  programs.home-manager.enable = true;
}
