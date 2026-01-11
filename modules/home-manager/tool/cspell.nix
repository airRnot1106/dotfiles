{ pkgs, ... }:
{
  home.packages = with pkgs; [ nodePackages.cspell ];

  xdg.configFile."cspell/cspell.json".source = ./configs/cspell/cspell.json;
  xdg.configFile."cspell/user.txt".source = ./configs/cspell/user.txt;
  xdg.configFile."cspell/vim.txt.gz".source = ./configs/cspell/vim.txt.gz;
}
