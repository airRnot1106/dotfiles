let
  explorer = {
    "explorer.confirmDelete" = false;
    "explorer.compactFolders" = false;
  };
in
{
  programs.vscode.profiles.default.userSettings = explorer;
}
