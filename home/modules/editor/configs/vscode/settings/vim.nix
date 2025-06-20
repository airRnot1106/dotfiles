let
  vim = {
    "vim.leader" = "<space>";
    "vim.useSystemClipboard" = true;
    "vim.visualstar" = true;
    "vim.highlightedyank.enable" = true;
    "vim.autoindent" = true;
    "vim.hlsearch" = true;
    "vim.surround" = true;
    "vim.insertModeKeyBindingsNonRecursive" = [
      {
        "before" = [
          "j"
          "j"
        ];
        "after" = [ "<Esc>" ];
      }
    ];
    "vim.normalModeKeyBindingsNonRecursive" = [
      # cursor
      {
        "before" = [ "j" ];
        "after" = [
          "g"
          "j"
        ];
      }
      {
        "before" = [ "k" ];
        "after" = [
          "g"
          "k"
        ];
      }
      {
        "before" = [ "J" ];
        "after" = [
          "1"
          "0"
          "j"
        ];
      }
      {
        "before" = [ "K" ];
        "after" = [
          "1"
          "0"
          "k"
        ];
      }
      {
        "before" = [ "H" ];
        "after" = [ "0" ];
      }
      {
        "before" = [ "<C-h>" ];
        "after" = [ "^" ];
      }
      {
        "before" = [ "L" ];
        "after" = [ "$" ];
      }
      {
        "before" = [
          "<Leader>"
          "<Leader>"
          "w"
        ];
        "commands" = [ "jumpy2.toggle" ];
      }
      # edit
      {
        "before" = [ "u" ];
        "commands" = [ "undo" ];
      }
      {
        "before" = [ "<C-r>" ];
        "commands" = [ "redo" ];
      }
      {
        "before" = [ "x" ];
        "after" = [
          "\""
          "_"
          "x"
        ];
      }
      {
        "before" = [ "X" ];
        "after" = [
          "\""
          "_"
          "X"
        ];
      }
      {
        "before" = [ "s" ];
        "after" = [
          "\""
          "_"
          "s"
        ];
      }
      {
        "before" = [ "S" ];
        "after" = [
          "\""
          "_"
          "S"
        ];
      }
      {
        "before" = [ "c" ];
        "after" = [
          "\""
          "_"
          "c"
        ];
      }
      {
        "before" = [ "C" ];
        "after" = [
          "\""
          "_"
          "C"
        ];
      }
      {
        "before" = [
          "d"
          "d"
        ];
        "after" = [
          "\""
          "_"
          "d"
          "d"
        ];
      }
      {
        "before" = [ "D" ];
        "after" = [
          "\""
          "_"
          "D"
        ];
      }
      {
        "before" = [ "<C-d>" ];
        "after" = [
          "d"
          "d"
        ];
      }
      {
        "before" = [
          "<Leader>"
          "/"
        ];
        "commands" = [ "editor.action.commentLine" ];
      }
      # buffer
      {
        "before" = [
          "<Leader>"
          "w"
        ];
        "commands" = [ ":w" ];
      }
      {
        "before" = [
          "<Leader>"
          "["
        ];
        "commands" = [ ":bp" ];
      }
      {
        "before" = [
          "<Leader>"
          "]"
        ];
        "commands" = [ ":bn" ];
      }
      {
        "before" = [
          "<Leader>"
          "d"
        ];
        "commands" = [ ":bd" ];
      }
      {
        "before" = [
          "<Leader>"
          "t"
          "o"
        ];
        "commands" = [ ":tabonly" ];
      }
      # window
      {
        "before" = [
          "<Leader>"
          "g"
          "v"
        ];
        "commands" = [ "workbench.action.splitEditor" ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "h"
        ];
        "after" = [
          "<C-w>"
          "h"
        ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "j"
        ];
        "after" = [
          "<C-w>"
          "j"
        ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "k"
        ];
        "after" = [
          "<C-w>"
          "k"
        ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "l"
        ];
        "after" = [
          "<C-w>"
          "l"
        ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "d"
        ];
        "commands" = [ "workbench.action.closeEditorsInGroup" ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "t"
          "o"
        ];
        "commands" = [ "workbench.action.closeEditorsInOtherGroups" ];
      }
      # filer
      {
        "before" = [
          "<Leader>"
          "e"
        ];
        "commands" = [ "workbench.view.explorer" ];
      }
      # editor
      {
        "before" = [
          "<Leader>"
          "\\"
        ];
        "commands" = [ "workbench.action.splitEditor" ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "["
        ];
        "commands" = [ "workbench.action.focusLeftGroup" ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "]"
        ];
        "commands" = [ "workbench.action.focusRightGroup" ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "d"
        ];
        "commands" = [ "workbench.action.closeEditorsInGroup" ];
      }
      {
        "before" = [
          "<Leader>"
          "g"
          "t"
          "o"
        ];
        "commands" = [ "workbench.action.closeEditorsInOtherGroups" ];
      }
      # appearance
      {
        "before" = [
          "<Esc>"
          "<Esc>"
        ];
        "commands" = [ ":nohlsearch" ];
      }
      # lsp
      {
        "before" = [ "<C-k>" ];
        "commands" = [ "editor.action.showHover" ];
      }
      {
        "before" = [
          "<Leader>"
          "."
        ];
        "commands" = [ "editor.action.autoFix" ];
      }
    ];
    "vim.visualModeKeyBindingsNonRecursive" = [
      # cursor
      {
        "before" = [ "j" ];
        "after" = [
          "g"
          "j"
        ];
      }
      {
        "before" = [ "k" ];
        "after" = [
          "g"
          "k"
        ];
      }
      {
        "before" = [ "J" ];
        "after" = [
          "1"
          "0"
          "j"
        ];
      }
      {
        "before" = [ "K" ];
        "after" = [
          "1"
          "0"
          "k"
        ];
      }
      {
        "before" = [ "H" ];
        "after" = [ "0" ];
      }
      {
        "before" = [ "<C-h>" ];
        "after" = [ "^" ];
      }
      {
        "before" = [ "L" ];
        "after" = [ "$" ];
      }
      # edit
      {
        "before" = [ "x" ];
        "after" = [
          "\""
          "_"
          "x"
        ];
      }
      {
        "before" = [ "X" ];
        "after" = [
          "\""
          "_"
          "X"
        ];
      }
      {
        "before" = [ "s" ];
        "after" = [
          "\""
          "_"
          "s"
        ];
      }
      {
        "before" = [ "S" ];
        "after" = [
          "\""
          "_"
          "S"
        ];
      }
      {
        "before" = [ "c" ];
        "after" = [
          "\""
          "_"
          "c"
        ];
      }
      {
        "before" = [ "C" ];
        "after" = [
          "\""
          "_"
          "C"
        ];
      }
      {
        "before" = [ "d" ];
        "after" = [
          "\""
          "_"
          "d"
        ];
      }
      {
        "before" = [ "D" ];
        "after" = [
          "\""
          "_"
          "D"
        ];
      }
      {
        "before" = [ "<C-d>" ];
        "after" = [ "d" ];
      }
      {
        "before" = [
          "<Leader>"
          "/"
        ];
        "commands" = [
          "editor.action.commentLine"
          "extension.vim_escape"
        ];
      }
      # buffer
      {
        "before" = [
          "<Leader>"
          "w"
        ];
        "commands" = [ ":w" ];
      }
    ];
  };
in
{
  programs.vscode.profiles.default.userSettings = vim;
}
