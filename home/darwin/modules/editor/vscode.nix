{ ... }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
  };

  imports = [ ./configs/vscode ];
}
