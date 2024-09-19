
{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    historySize = 10000;

}
