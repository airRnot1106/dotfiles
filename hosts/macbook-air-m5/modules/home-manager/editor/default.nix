{ modules, ... }:
{
  imports = with modules.home-manager.editor; [
    neovim
  ];
}
