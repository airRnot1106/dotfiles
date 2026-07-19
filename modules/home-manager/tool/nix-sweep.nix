{ pkgs, ... }:
{
  home.packages = with pkgs; [ nix-sweep ];
  xdg.configFile."nix-sweep/presets.toml".source = pkgs.writers.writeTOML "presets.toml" {
    housekeeping = {
      keep-min = 5;
      remove-older = "7d";
      interactive = true;
      gc = true;
    };
    only-remove-really-old = {
      keep-min = 10;
      remove-older = "1mon";
      interactive = true;
      gc = true;
    };
  };
}
