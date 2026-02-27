{ lib, config, ... }:
let
  containerDir = "${config.home.homeDirectory}/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents";
  targetDir = "${containerDir}/Settings";
  sourceFile = ./data/kana-rule.conf;
in
{
  home.activation.macskk = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -d "${containerDir}" ]; then
      run mkdir -p "${targetDir}"
      run cp -f "${sourceFile}" "${targetDir}/kana-rule.conf"
      run chmod 644 "${targetDir}/kana-rule.conf"
      echo "macSKK kana-rule.conf installed."
    else
      echo "macSKK container not found. Skipping kana-rule.conf installation."
      echo "Install macSKK first, then run home-manager switch again."
    fi
  '';
}
