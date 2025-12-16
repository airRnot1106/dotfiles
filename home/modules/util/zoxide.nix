{ pkgs, ... }:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--no-cmd"
    ];
  };
  home.packages = with pkgs; [
    ghq
  ];
  programs.git.settings.ghq.root = "~/dev";
  programs.zsh.initContent = ''
    __zoxide_list_missing() {
      diff \
        <( zoxide query --list | sort ) \
        <( ghq list -p | sort) \
        | grep '^> ' | sed 's/^> //'
    }

    __zoxide_add_missing() {
      local missing
      missing=( $( __zoxide_list_missing ) )
      if [[ ''${#missing[@]} -gt 0 ]]; then
        zoxide add $missing
      fi
    }

    cd(){
      __zoxide_z "$@"
    }

    cdi() {
      __zoxide_add_missing
      __zoxide_zi "$@" || true
    }
  '';
}
