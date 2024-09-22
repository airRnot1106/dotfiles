{ ... }:
let
  window = {
    # window
    "window.title" = "\${dirty}\${activeEditorMedium}\${separator}\${rootName}";
    "window.closeWhenEmpty" = false;
    "window.restoreWindows" = "none";
  };
in
{
  programs.vscode.userSettings = window;
}
