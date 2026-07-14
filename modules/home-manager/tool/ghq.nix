{ profile, pkgs, ... }:
{
  home.packages = with pkgs; [ ghq ];
  programs.git.settings.ghq.root = "~/dev";
  programs.git.settings.ghq.user = profile.gitUsername;
}
