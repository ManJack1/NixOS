{ config, pkgs, ... }:

{
  # Browsers
  programs.firefox.enable = true;

  # System utilities
  home.packages = with pkgs; [
    spotube
    # Browsers
    google-chrome

    # Communication
    discord
    wechat-uos

    # Media
    spotify

    # File management
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman

    # System tools
    brightnessctl
    playerctl
    libnotify
    cliphist
    pavucontrol
    networkmanagerapplet
    blueman
    bluez
    bluez-tools

    # Launchers
    wofi

    # Window managers (fallback)
    sway
    kdePackages.sddm

    # Icon themes
    papirus-icon-theme

    # Keyboard tools
    kbdd
    xxkb

    # Media pipeline
    pipewire

    # Network tools
    clash-verge-rev
    flameshot
    emacs
  ];
}
