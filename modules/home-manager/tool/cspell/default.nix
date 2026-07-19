{ pkgs, config, ... }:
let
  cspellDir = "${config.xdg.configHome}/cspell";
in
{
  home.packages = [ pkgs.cspell ];

  xdg.configFile."cspell/global.json".text = builtins.toJSON {
    "$schema" = "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json";
    version = "0.2";
    allowCompoundWords = true;
    dictionaries = [
      "bash"
      "companies"
      "cpp"
      "csharp"
      "css"
      "dart"
      "docker"
      "en_us"
      "filetypes"
      "fonts"
      "fullstack"
      "gaming-terms"
      "git"
      "golang"
      "google"
      "html"
      "html-symbol-entities"
      "lorem-ipsum"
      "lua"
      "markdown"
      "node"
      "public-licenses"
      "python"
      "rust"
      "softwareTerms"
      "sql"
      "typescript"
      "user"
      "vim"
      "vue"
    ];
    dictionaryDefinitions = [
      {
        name = "user";
        path = "${cspellDir}/user.txt";
        description = "User Dictionary";
      }
      {
        name = "vim";
        path = "${cspellDir}/vim.txt.gz";
        description = "Vim Script Language Dictionary";
      }
    ];
  };
  xdg.configFile."cspell/user.txt".source = ./_configs/user.txt;
  xdg.configFile."cspell/vim.txt.gz".source = ./_configs/vim.txt.gz;

  home.file."Library/Preferences/cspell/cspell.json".text = builtins.toJSON {
    import = [ "${cspellDir}/global.json" ];
  };
}
