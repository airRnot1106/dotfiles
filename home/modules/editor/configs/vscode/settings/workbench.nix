let
  workbench = {
    "workbench.editor.showTabs" = "multiple";
    "workbench.iconTheme" = "vscode-icons";
  };
in
{
  programs.vscode.profiles.default.userSettings = workbench;
}
