{ ... }:
let
  window = {
    "window.closeWhenEmpty" = false;
    "window.restoreWindows" = "none";
    "window.title" = "\${dirty}\${activeEditorMedium}\${separator}\${rootName}";
  };
in
{
  programs.vscode.profiles.default.userSettings = window;
}
