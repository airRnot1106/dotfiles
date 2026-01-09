{
  programs.go = {
    enable = true;
    env = {
      GOPATH = "$HOME/.local/share/go";
      GOBIN = "$HOME/.local/bin";
    };
  };
}
