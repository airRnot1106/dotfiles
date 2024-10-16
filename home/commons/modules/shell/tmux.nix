{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    # see: https://github.com/nix-community/home-manager/issues/5952
    package = pkgs.tmux.overrideAttrs (old: rec {
      version = "3.5";
      src = pkgs.fetchFromGitHub {
        owner = "tmux";
        repo = "tmux";
        rev = version;
        hash = "sha256-8CRZj7UyBhuB5QO27Y+tHG62S/eGxPOHWrwvh1aBqq0=";
      };
    });
    aggressiveResize = true;
    clock24 = true;
    escapeTime = 0;
    historyLimit = 30000;
    newSession = true;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      rose-pine
    ];
    terminal = "tmux-256color";
    extraConfig = ''
      # update the env when attaching to an existing session
      set -g update-environment -r

      set -ag terminal-overrides ",alacritty*:Tc,foot*:Tc,xterm-kitty*:Tc,xterm-256color:Tc"

      set -g @plugin 'rose-pine/tmux'
      set -g @plugin 'tmux-plugins/tpm'
      set -g @rose_pine_variant 'moon'
      set -g @rose_pine_host 'on'
      set -g @rose_pine_date_time 'on'
      set -g @rose_pine_user 'on'
      set -g @rose_pine_directory 'on'
      set -g @rose_pine_bar_bg_disable 'on'
      set -g @rose_pine_bar_bg_disabled_color_option 'default'
      set -g @rose_pine_only_windows 'on'
      set -g @rose_pine_disable_active_window_menu 'on'
      set -g @rose_pine_default_window_behavior 'on'
      set -g @rose_pine_show_current_program 'on'
      set -g @rose_pine_show_pane_directory 'on'
      # Example values for these can be:
      set -g @rose_pine_left_separator ' > ' # The strings to use as separators are 1-space padded
      set -g @rose_pine_right_separator ' < ' # Accepts both normal chars & nerdfont icons
      set -g @rose_pine_field_separator ' | ' # Again, 1-space padding, it updates with prefix + I
      set -g @rose_pine_window_separator ' - ' # Replaces the default `:` between the window number and name

      # These are not padded
      set -g @rose_pine_session_icon '' # Changes the default icon to the left of the session name
      set -g @rose_pine_current_window_icon '' # Changes the default icon to the left of the active window name
      set -g @rose_pine_folder_icon '' # Changes the default icon to the left of the current directory folder
      set -g @rose_pine_username_icon '' # Changes the default icon to the right of the hostname
      set -g @rose_pine_hostname_icon '󰒋' # Changes the default icon to the right of the hostname
      set -g @rose_pine_date_time_icon '󰃰' # Changes the default icon to the right of the date module
      set -g @rose_pine_window_status_separator "  " # Changes the default icon that appears between window names

      # Very beta and specific opt-in settings, tested on v3.2a, look at issue #10
      set -g @rose_pine_prioritize_windows 'on' # Disables the right side functionality in a certain window count / terminal width
      set -g @rose_pine_width_to_hide '80' # Specify a terminal width to toggle off most of the right side functionality
      set -g @rose_pine_window_count '5' # Specify a number of windows, if there are more than the number, do the same as width_to_hide
    '';
  };
}
