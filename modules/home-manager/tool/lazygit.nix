{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFontsVersion = "3";
      };
      git = {
        pagers = [ { pager = "delta --dark --paging=never"; } ];
        branchLogCmd = "git log --graph --color=always --date=format:'%Y-%m-%d %H:%M' --pretty=format:'%C(#a0a0a0 reverse)%h%Creset %C(cyan)%ad%Creset %C(#dd4814)%ae%Creset %C(yellow reverse)%d%Creset %n%C(white bold)%s%Creset%n' {{branchName}} --";
        overrideGpg = true;
      };
      customCommands = [
        {
          key = "<c-g>";
          context = "files";
          output = "terminal";
          command = ''
            MSG=$(git diff --cached | claude --no-session-persistence --print --model haiku \
              'Generate ONLY a one-line Git commit message following Conventional Commits format \
              (type(scope): description). Types: feat, fix, docs, style, refactor, test, chore. \
              Based strictly on the diff from stdin. Output ONLY the message, nothing else.') \
              && git commit -e -m "$MSG"
          '';
        }
      ];
    };
  };
}
