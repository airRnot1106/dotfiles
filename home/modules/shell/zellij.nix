{ ... }:
{
  programs.zellij = {
    enable = true;
  };

  programs.zsh.initContent = ''
    eval "$(zellij setup --generate-auto-start zsh)"
  '';

  home.file = {
    zellij = {
      source = ./configs/zellij;
      target = ".config/zellij";
    };
  };
}
