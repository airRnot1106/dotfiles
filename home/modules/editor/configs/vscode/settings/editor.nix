{ ... }:
let
  editor = {
    "editor.acceptSuggestionOnCommitCharacter" = false;
    "editor.codeActionsOnSave" = {
      "quickfix.biome" = "explicit";
      "source.organizeImports.biome" = "explicit";
    };
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    "editor.folding" = false;
    "editor.formatOnSave" = true;
    "editor.glyphMargin" = true;
    "editor.guides.bracketPairs" = true;
    "editor.inlineSuggest.enabled" = true;
    "editor.insertSpaces" = true;
    "editor.lineHeight" = 18;
    "editor.links" = true;
    "editor.matchBrackets" = "always";
    "editor.minimap.enabled" = false;
    "editor.quickSuggestions" = {
      "strings" = "on";
    };
    "editor.renderLineHighlight" = "all";
    "editor.renderWhitespace" = "boundary";
    "editor.scrollBeyondLastLine" = true;
    "editor.suggestSelection" = "first";
    "editor.tabSize" = 2;
  };
in
{
  programs.vscode.profiles.default.userSettings = editor;
}
