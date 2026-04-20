{ profile, ... }:
{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
  programs.git = {
    enable = true;
    settings = {
      alias = {
        st = "status";
        ss = "status -s";
      };
      user = {
        email = profile.gitEmail;
        name = profile.gitUsername;
        signingkey = profile.gitSigningKey;
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
    signing.format = "openpgp";
  };
  programs.mergiraf = {
    enable = true;
    enableGitIntegration = true;
  };
}
