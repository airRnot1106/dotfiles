{ ... }:
let
  git = {
    "git.autofetch" = true;
  };
in
{
  programs.vscode.userSettings = git;
}
