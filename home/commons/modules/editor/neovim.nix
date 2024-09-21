{ pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    # package = pkgs.neovim.overrideAttrs (old: {
    #   version = "0.10.1";
    # }); # inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;
  };
}
