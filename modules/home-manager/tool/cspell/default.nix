{ lib, ... }:
{
  imports = [ ./options.nix ];

  programs.cspell = {
    enable = lib.mkDefault true;
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
        path = "~/.config/cspell/user.txt";
        description = "User Dictionary";
      }
      {
        name = "vim";
        path = "~/.config/cspell/vim.txt.gz";
        description = "Vim Script Language Dictionary";
      }
    ];
  };

  xdg.configFile."cspell/user.txt".source = ./data/user.txt;
  xdg.configFile."cspell/vim.txt.gz".source = ./data/vim.txt.gz;
}
