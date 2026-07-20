{ modules, ... }:
{
  imports = with modules.nix-darwin.homebrew.brew; [
    moshi-hook
  ];
}
