{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    google-chrome
    xfce.thunar # 主力文件管理器
    xfce.thunar-volman

    spotify
    discord

    niri
    xdg-desktop-portal-gnome
    xwayland-satellite
    snixembed
    kbdd
    xxkb
    pipewire
    kitty
    wlr-randr
    alacritty
    # 编辑器和基础工具
    vim
    wget
    curl

    # 搜索和查找工具
    ripgrep
    nodejs
    unzip

    # 编程语言和工具链
    cargo # Rust
    clang
    cmake
    lldb
    python3
    python3Packages.pip
    luarocks # Lua
    go # Go
    ruby # Ruby
    php # PHP
    phpPackages.composer
    jdk # Java
    julia # Julia

    # LSP 和代码工具
    shellcheck
    taplo # TOML LSP
    tree-sitter

    # 剪贴板支持
    wl-clipboard # Wayland
    xclip # X11

    # 文档和图表工具
    tectonic # LaTeX
    graphviz
    ghostscript

    # 字体
    lxgw-wenkai
    # Maple Mono (Ligature TTF unhinted)
    maple-mono.truetype
    # Maple Mono NF (Ligature unhinted)
    maple-mono.NF-unhinted
    # Maple Mono NF CN (Ligature unhinted)
    maple-mono.NF-CN-unhinted
    noto-fonts-cjk-sans # 思源黑体
    noto-fonts-cjk-serif # 思源宋体
    # 字体包
    # 等宽字体(编程用)
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code

    # 英文字体
    inter # 现代无衬线字体
    noto-fonts # Google Noto

    # Emoji
    noto-fonts-emoji

    # Sway 相关工具
    wofi # 应用启动器
    grim # 截图工具
    slurp # 区域选择
    brightnessctl # 亮度控制
    playerctl # 媒体控制
    libnotify # 通知
    jq # JSON 处理
    cliphist # 剪贴板历史
    # thunar # 文件管理器
    pavucontrol # 音量控制GUI
    networkmanagerapplet # 网络管理器
    # 系统托盘图标主题
    papirus-icon-theme
    xdg-desktop-portal
  ];

  programs.dankMaterialShell.enable = true;
  # Firefox 配置
  programs.firefox.enable = true;

  # Alacritty 配置
  programs.alacritty.enable = true;

  programs.waybar.enable = false;

  # Lazygit 配置
  programs.lazygit.enable = true;
  programs.fastfetch.enable = true;
  programs.kitty.enable = true;

}

