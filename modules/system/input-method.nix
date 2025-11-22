{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-gtk
        qt6Packages.fcitx5-chinese-addons
        qt6Packages.fcitx5-configtool
        fcitx5-nord
        catppuccin-fcitx5
        # 添加 Qt 支持
        kdePackages.fcitx5-qt
        # 或 qt5
        libsForQt5.fcitx5-qt
      ];
    };
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
    INPUT_METHOD = "fcitx";
    FCITX_USE_WAYLAND = "0"; # 可选：强制使用 XWayland
  };
}
