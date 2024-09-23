{ pkgs, ... }:
{
  users = {
    users.airrnot = {
      isNormalUser = true;
      shell = pkgs.bash;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
