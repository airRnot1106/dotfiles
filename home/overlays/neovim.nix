{ pkgs }:

final: prev: {
  neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs rec {
    version = "0.10.1";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "v${version}";
      hash = "sha256-OsHIacgorYnB/dPbzl1b6rYUzQdhTtsJYLsFLJxregk=";
    };
  };
}
