{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Wayland environment variables
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
  };

  # Wayland utilities
  programs.rofi.enable = true;
  programs.i3status-rust.enable = true;

  # Niri desktop shell
  programs.dankMaterialShell.enable = true;

  # File copying for config files
  home.file = {
    ".config/sway".source = ../../../config/sway;
    ".config/kitty".source = ../../../config/kitty;
    ".config/rofi".source = ../../../config/rofi;
    ".config/niri".source = ../../../config/niri;
    ".p10k.zsh".source = ../../../config/zsh/.p10k.zsh;
    ".config/starship.toml".source = ../../../config/starship/starship.toml;
  };

  home.packages = with pkgs; [
    catppuccin-gtk

    # Wayland core
    wlr-randr
    wl-clipboard
    xclip
    grim
    slurp

    # Niri specific
    niri
    xwayland-satellite
    snixembed

    # Desktop portals
    xdg-desktop-portal
    xdg-desktop-portal-gnome

    # 首先安装需要的主题包
    nordic # Nordic 主题包
    papirus-icon-theme
    lxappearance
  ];
  # 这里是用户级配置的命名空间
  gtk = {
    enable = true;

    cursorTheme = {
      name = "Nordic-cursor";
      package = pkgs.nordic;
    };

    theme = {
      name = "Nordic-bluish"; # 主题的确切名称
      package = pkgs.nordic; # 对应的包
    };

    iconTheme = {
      name = "Nordzy-dark";
      package = pkgs.nordzy-icon-theme;
    };

  };

}
