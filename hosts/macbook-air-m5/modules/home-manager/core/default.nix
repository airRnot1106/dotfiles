{ modules }:
{
  imports = with modules.home-manager.core; [
    ghostty
    zsh
    git
    gpg
    oh-my-posh
  ];
}
