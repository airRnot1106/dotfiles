{ ... }:
let
  explorer = {
    "explorer.confirmDelete" = false;
    "explorer.compactFolders" = false;
  };
in
{
  programs.vscode.userSettings = explorer;
}
