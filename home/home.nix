{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/shell.nix
    ./modules/editor.nix
    ./modules/desktop.nix
    ./modules/dev.nix
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    # inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  home.username = "manjack";
  home.homeDirectory = "/home/manjack";
  home.stateVersion = "25.05";

  # 复制配置文件
  home.file = {
    ".config/sway".source = ../config/sway;
    ".config/kitty".source = ../config/kitty;
    # ".config/nvim".source = ../config/nvim;
    ".config/rofi".source = ../config/rofi;
    ".config/niri".source = ../config/niri;
    # ".config/tmux".source = ../config/tmux;
    ".p10k.zsh".source = ../config/zsh/.p10k.zsh;
  };

  programs.home-manager.enable = true;
}
