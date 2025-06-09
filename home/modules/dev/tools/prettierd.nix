{ pkgs, ... }:
{
  home.packages = with pkgs; [ prettierd ];

  home.sessionVariables.PRETTIERD_LOCAL_PRETTIER_ONLY = 1;
}
