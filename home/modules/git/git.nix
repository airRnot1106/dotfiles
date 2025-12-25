let
  inherit (import ../../../profile.nix)
    gitUsername
    gitEmail
    gitSigningKey
    ;
in
{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        st = "status";
        ss = "status -s";
      };
      user = {
        email = gitEmail;
        name = gitUsername;
        signingkey = gitSigningKey;
      };
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
      commit = {
        gpgsign = true;
      };
    };
  };
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
