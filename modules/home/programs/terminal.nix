{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    prefix = "C-a";
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];

    extraConfig = ''
      # Terminal settings
      set-option -a terminal-overrides ",*256col*:RGB"

      # Status bar settings
      set-option -g status-position bottom
      set -g display-time 4000
      set -g status-interval 5
      set -g status-keys emacs
      set -g focus-events on
      setw -g aggressive-resize on

      # Prefix key settings
      unbind C-b
      bind C-a send-prefix

      # Tokyo Night theme
      set -g @tokyo-night-tmux_show_datetime 0
      set -g @tokyo-night-tmux_window_id_style digital
      set -g @tokyo-night-tmux_pane_id_style hsquare
      set -g @tokyo-night-tmux_zoom_id_style dsquare
      set -g @tokyo-night-tmux_show_music 1
      set -g @tokyo-night-tmux_show_path 1
      set -g @tokyo-night-tmux_path_format relative
      set -g @tokyo-night-tmux_show_battery_widget 1
      set -g @tokyo-night-tmux_battery_name "BAT1"
      set -g @tokyo-night-tmux_battery_low_threshold 21

      # Quick window switching
      bind C-p previous-window
      bind C-n next-window

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded!"
      bind R source-file ~/.config/tmux/tmux.conf

      # New window
      bind -n M-w new-window

      # Split window
      bind -n M-v split-window -h
      bind -n M-c split-window -v

      # Switch tabs
      bind -n M-, previous-window
      bind -n M-. next-window

      # Alt + number to switch window
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9

      # Resize pane
      bind -n M-h resize-pane -L 5
      bind -n M-k resize-pane -U 5
      bind -n M-l resize-pane -R 5
      bind -n M-j resize-pane -D 5

      # Close pane
      bind -n M-q kill-pane

      # vim-tmux-navigator support
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^(.*\s)?(vi|vim|nvim|view|less|nano)(\s.*)?$'"
      bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
      bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
      bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
      bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"

      # TPM plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin "janoamaral/tokyo-night-tmux"

      # Initialize TPM
      run '~/.tmux/plugins/tpm/tpm'
    '';
  };

  programs.kitty.enable = true;
  programs.alacritty.enable = true;

  home.packages = with pkgs; [
    tmux
    kitty
    alacritty
  ];
}
