{ pkgs, profile, ... }:
let
  user = profile.gitUsername;
in
{
  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-dash
      gh-stack
    ];
    hosts = {
      "github.com" = {
        git_protocol = "ssh";
        users = [ user ];
        inherit user;
      };
    };
    settings = {
      editor = "nvim";
      git_protocol = "ssh";
      prefer_editor_prompt = "disabled";
      prompt = "enabled";
    };
  };
}
