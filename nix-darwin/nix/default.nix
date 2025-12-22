let
  inherit (import ../../profile.nix)
    username
    ;
in
{
  nix = {
    extraOptions = ''
      trusted-users = root ${username}
    '';
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };
}
