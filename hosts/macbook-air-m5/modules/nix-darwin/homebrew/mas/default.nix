{ modules, ... }:
{
  imports = with modules.nix-darwin.homebrew.mas; [
    line
    run-cat-neo
    yoink
  ];
}
