{ lib, profile, ... }:
{
  system.primaryUser = lib.mkDefault profile.username;
}
