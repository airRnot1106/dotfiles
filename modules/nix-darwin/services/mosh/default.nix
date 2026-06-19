{
  imports = [ ./module.nix ];

  services.mosh = {
    enable = true;
    enableMoshiIntegration = true;
  };
}
