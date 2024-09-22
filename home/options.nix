{
  # general
  username = builtins.getEnv "USER";

  # git
  gitUsername = builtins.getEnv "GIT_USERNAME";
  gitEmail = builtins.getEnv "GIT_EMAIL";

  # open_ai
  openaiKey = builtins.getEnv "OPENAI_KEY";
}
