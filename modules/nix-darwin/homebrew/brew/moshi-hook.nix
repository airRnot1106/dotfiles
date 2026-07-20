{
  homebrew = {
    taps = [
      {
        name = "rjyo/moshi";
        trusted = true;
      }
    ];
    brews = [ "moshi-hook" ];
  };

  launchd.user.agents.moshi-hook = {
    serviceConfig = {
      ProgramArguments = [
        "/opt/homebrew/bin/moshi-hook"
        "serve"
      ];
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/opt/homebrew/var/log/moshi-hook.log";
      StandardErrorPath = "/opt/homebrew/var/log/moshi-hook.log";
      WorkingDirectory = "/opt/homebrew/var";
    };
  };
}
