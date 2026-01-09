{
  programs.home-manager.enable = true;

  imports = [
    ./core
    ./editor
    ./home
    ./language
    ./lsp
    ./tool
  ];
}
