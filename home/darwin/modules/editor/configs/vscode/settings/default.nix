{ ... }:
let
in
# inherit (import ./vim.nix) vim;
{
  # programs.vscode.userSettings = vim;
  imports = [
    ./vim.nix
    ./window.nix
  ];
}
