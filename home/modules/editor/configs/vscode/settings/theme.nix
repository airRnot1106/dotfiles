{ ... }:
let
  theme = {
    "workbench.colorTheme" = "Illusion Bordered";
    "indentRainbow.colors" = [
      "rgba(128, 64, 64, 0.5)"
      "rgba(128, 96, 32, 0.5)"
      "rgba(128, 128, 32, 0.5)"
      "rgba( 32, 128, 32, 0.5)"
      "rgba( 32, 64, 128, 0.5)"
      "rgba(128, 64, 128, 0.5)"
    ];
  };
in
{
  programs.vscode.profiles.default.userSettings = theme;
}
