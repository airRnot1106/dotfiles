{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
  };

  imports = [
    ./casks
    ./masApps
  ];
}
