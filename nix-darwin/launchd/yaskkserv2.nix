{ pkgs, profile, ... }:
{
  launchd.user.agents.yaskkserv2 = {
    command = "${pkgs.yaskkserv2}/bin/yaskkserv2 --google-suggest --google-japanese-input=last --google-cache-filename=/tmp/yaskkserv2.cache /Users/${profile.username}/.config/skk/yaskkserv2.dictionary";
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/yaskkserv2.log";
      StandardErrorPath = "/tmp/yaskkserv2.err";
    };
  };
}
