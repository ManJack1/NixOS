{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/boot.nix
    ../../modules/system/locale.nix
    ../../modules/system/networking.nix
    ../../modules/system/fonts.nix
    ../../modules/system/input-method.nix
    ../../modules/system/hardware.nix
    ../../modules/system/services.nix
  ];

  # Programs
  programs.zsh.enable = true;
  programs.dconf.enable = true;

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
  };

  # Users
  users.users.manjack = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "manjack";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # System packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    (python3.withPackages (ps: with ps; [ pynvim ]))
    # TeX Live full scheme
    texlive.combined.scheme-full

    # PDF viewer
    zathura

    # Image processing
    imagemagick
    graphicsmagick
    inkscape
    librsvg
    ghostscript
    poppler_utils

    # Format conversion
    ffmpeg
    libwebp

    # Image optimization
    optipng
    jpegoptim
    pngquant

    # Viewers
    evince
    feh

    # Bluetooth tools
    bluez
    bluez-tools
    blueman

    # File management
    xfce.thunar
    xfce.thunar-volman

    # Window managers
    sway

    # Display manager
    kdePackages.sddm

    # System libraries
    stdenv.cc.cc.lib
    zlib
    openssl

    # Proxy tools
    clash-verge-rev

    # Mermaid CLI
    mermaid-cli
  ];

  # XDG configuration
  xdg.mime.defaultApplications = { "inode/directory" = "thunar.desktop"; };

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System version
  system.stateVersion = "25.05";

  # Home Manager
  home-manager.backupFileExtension = "backup";
}
