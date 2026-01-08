{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [ yaskkserv2 ];
  home.activation.yaskkserv2 = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "Creating yaskkserv2 dictionary..."
    ${pkgs.yaskkserv2}/bin/yaskkserv2_make_dictionary --dictionary-filename=${config.xdg.configHome}/skk/yaskkserv2.dictionary ${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L
  '';
}
