{
  nix = {
    extraOptions = ''
      trusted-users = root airrnot
    '';
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };
}
