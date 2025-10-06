{
  # general
  username = builtins.getEnv "USER";

  # git
  gitUsername = builtins.getEnv "GIT_USERNAME";
  gitEmail = builtins.getEnv "GIT_EMAIL";
}
