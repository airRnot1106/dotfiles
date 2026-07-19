{
  inputs,
  lib,
  pkgs,
  config,
  profile,
  ...
}:
let
  yaskkserv2 = inputs.nur-packages.packages.${pkgs.stdenv.hostPlatform.system}.yaskkserv2;
  containerDir = "${config.home.homeDirectory}/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents";
  targetDir = "${containerDir}/Settings";
  sourceFile = ./_configs/kana-rule.conf;
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

  home.packages = [ yaskkserv2 ];
  home.activation.yaskkserv2 = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "Creating yaskkserv2 dictionary..."
    run mkdir -p "${config.xdg.configHome}/skk"
    run ${yaskkserv2}/bin/yaskkserv2_make_dictionary --dictionary-filename=${config.xdg.configHome}/skk/yaskkserv2.dictionary ${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L
  '';
  launchd.agents.yaskkserv2 = {
    enable = true;
    config = {
      Program = "${yaskkserv2}/bin/yaskkserv2";
      ProgramArguments = [
        "--no-daemonize"
        "--google-suggest"
        "--google-japanese-input=notfound"
        "--google-cache-filename=/tmp/yaskkserv2.cache"
        "/Users/${profile.username}/.config/skk/yaskkserv2.dictionary"
      ];
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/yaskkserv2.log";
      StandardErrorPath = "/tmp/yaskkserv2.err";
    };
  };
}
