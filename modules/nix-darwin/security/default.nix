{ lib, ... }:
{
  security.pam.services.sudo_local.touchIdAuth = lib.mkDefault true;
}
