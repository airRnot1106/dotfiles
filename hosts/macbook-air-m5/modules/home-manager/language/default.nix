{ modules, ... }:
{
  imports = with modules.home-manager.language; [
    deno
    go
    nodejs
  ];
}
