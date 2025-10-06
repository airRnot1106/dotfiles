{ pkgs, ... }:
{
  home.packages = with pkgs; [ edge.claude-code ];
}
