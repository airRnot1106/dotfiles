{ pkgs, ... }:
{
  programs.vscode = {
    mutableExtensionsDir = true;
    extensions =
      (with pkgs.vscode-extensions; [ ms-ceintl.vscode-language-pack-ja ])
      ++ (with pkgs.vscode-marketplace; [ biomejs.biome ]);
  };
}
