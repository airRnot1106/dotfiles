{ ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;
    };
  };

  imports = [ ./configs/vscode ];
}
