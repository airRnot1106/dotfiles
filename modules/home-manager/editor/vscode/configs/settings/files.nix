let
  files = {
    "files.associations" = {
      "*.arb" = "json";
    };
    "files.autoGuessEncoding" = true;
    "files.eol" = "\n";
    "files.exclude" = {
      "**/.git" = true;
      "**/.svn" = true;
      "**/.hg" = true;
      "**/CVS" = true;
      "**/.DS_Store" = true;
      "**/Thumbs.db" = true;
      "**/.history/" = true;
    };
    "files.insertFinalNewline" = true;
  };
in
{
  programs.vscode.profiles.default.userSettings = files;
}
