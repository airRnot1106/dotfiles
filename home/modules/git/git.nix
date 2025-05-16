{ ... }:
let
  inherit (import ../../options.nix) gitUsername gitEmail;
in
{
  programs.git = {
    enable = true;
    userName = gitUsername;
    userEmail = gitEmail;
    aliases = {
      st = "status";
      ss = "status -s";
    };
    extraConfig = {
      core = {
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
      delta = {
        navigate = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
    };
    delta = {
      enable = true;
    };

  };
}
