let
  git = {
    "git.autofetch" = true;
  };
in
{
  programs.vscode.profiles.default.userSettings = git;
}
