{ ... }:
{
  programs.vscode.profiles.default.keybindings = [
    {
      key = "ctrl+j";
      command = "editor.action.inlineSuggest.commit";
      when = "inlineSuggestionHasIndentationLessThanTabSize && inlineSuggestionVisible && !editorHoverFocused && !editorTabMovesFocus && !suggestWidgetVisible";
    }
    {
      key = "tab";
      command = "-editor.action.inlineSuggest.commit";
      when = "inlineSuggestionHasIndentationLessThanTabSize && inlineSuggestionVisible && !editorHoverFocused && !editorTabMovesFocus && !suggestWidgetVisible";
    }
    {
      key = "q";
      command = "workbench.action.focusActiveEditorGroup";
      when = "workbench.explorer.openEditorsView.active && !inputFocus";
    }
  ];
}
