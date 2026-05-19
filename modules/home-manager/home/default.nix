{ profile, ... }:
{
  home = {
    homeDirectory = "/Users/${profile.username}";
    username = profile.username;

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";
  };
}
