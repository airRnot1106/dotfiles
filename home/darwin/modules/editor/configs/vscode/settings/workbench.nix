{ ... }:
let
  workbench = {
    "workbench.editor.showTabs" = "multiple";
    "workbench.iconTheme" = "vscode-icons";
  };
in
{
  programs.vscode.userSettings = workbench;
}
