{ pkgs, lib, ... }:
{
  # Symlink for ~/.config/skk
  xdg.configFile."skk/SKK-JISYO.L".source = "${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L";

  # # Copy actual file for macSKK (not symlink)
  # home.activation.copyMacSKKDictionary = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   # Create directory if it doesn't exist
  #   $DRY_RUN_CMD mkdir -p "$HOME/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries"
  #
  #   # Copy actual file instead of creating symlink
  #   $DRY_RUN_CMD cp -f ${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L "$HOME/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.L"
  # '';
}
