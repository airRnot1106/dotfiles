{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.mosh;
in
{
  options.services.mosh = {
    enable = mkEnableOption "Mosh (mobile shell) server";

    package = mkOption {
      type = types.package;
      default = pkgs.mosh;
      defaultText = literalExpression "pkgs.mosh";
      description = "The package to use for mosh";
    };

    enableMoshiIntegration = mkEnableOption "moshi-hook companion daemon for the Moshi iOS app";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      environment.systemPackages = [ cfg.package ];
    }
    (mkIf cfg.enableMoshiIntegration {
      homebrew.taps = [
        {
          name = "rjyo/moshi";
          trusted = true;
        }
      ];
      homebrew.brews = [
        {
          name = "moshi-hook";
          start_service = true;
        }
      ];
    })
  ]);
}
