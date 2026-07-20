{ modules, ... }:
{
  imports = with modules.nix-darwin.service; [
    tailscale
  ];
}
