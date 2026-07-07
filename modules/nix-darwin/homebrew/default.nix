{ lib, ... }:
{
  environment.systemPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  homebrew = {
    enable = lib.mkDefault true;
    onActivation = {
      autoUpdate = lib.mkDefault true;
      cleanup = lib.mkDefault "uninstall";
      extraFlags = lib.mkDefault [ "--force-cleanup" ];
      upgrade = lib.mkDefault true;
    };
  };
}
