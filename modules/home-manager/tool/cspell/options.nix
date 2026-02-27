{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.cspell;
in
{
  options.programs.cspell = {
    enable = lib.mkEnableOption "cspell";
    dictionaries = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
    dictionaryDefinitions = lib.mkOption {
      type = lib.types.listOf lib.types.attrs;
      default = [ ];
    };
    languageSettings = lib.mkOption {
      type = lib.types.listOf lib.types.attrs;
      default = [ ];
    };
    allowCompoundWords = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ nodePackages.cspell ];
    xdg.configFile."cspell/cspell.json".text = builtins.toJSON {
      "$schema" = "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json";
      version = "0.2";
      inherit (cfg)
        allowCompoundWords
        dictionaries
        dictionaryDefinitions
        languageSettings
        ;
    };
  };
}
