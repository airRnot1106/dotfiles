{ ... }:
let
  inherit (import ./vim.nix) vim;
in
{
  programs.vscode.userSettings = {
    inherit vim;
  };
}
