{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  # 启用 nix-ld 以支持动态链接的二进制文件
  programs.nix-ld.enable = true;

  # 添加常用的动态链接库
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
  ];

  # ============================================================================
  # 启动加载器配置
  # ============================================================================
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ============================================================================
  # 网络配置
  # ============================================================================
  networking.hostName = "manjack";
  networking.networkmanager.enable = true;

  # ============================================================================
  # 时区和本地化
  # ============================================================================
  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  # ============================================================================
  # 字体配置
  # ============================================================================
  fonts.packages = with pkgs; [
    # 西文字体
    noto-fonts
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    # 中文字体
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    wqy_microhei
    wqy_zenhei
    # 等宽字体
    jetbrains-mono
    source-han-sans
    source-han-serif
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif CJK SC" "Noto Serif" ];
      sansSerif = [ "Noto Sans CJK SC" "Noto Sans" ];
      monospace = [ "JetBrains Mono" "Fira Code" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # ============================================================================
  # 输入法配置
  # ============================================================================
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-gtk
        fcitx5-chinese-addons
        fcitx5-configtool
        fcitx5-nord
      ];
    };
  };

  # ============================================================================
  # 环境变量配置
  # ============================================================================
  environment.sessionVariables = {
    # 输入法环境变量
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
    INPUT_METHOD = "fcitx";

    # Wayland 相关
    NIXOS_OZONE_WL = "1";

    # Niri 特定配置
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
  };

  # ============================================================================
  # 硬件配置
  # ============================================================================

  # 蓝牙
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };

  # ============================================================================
  # 系统服务
  # ============================================================================

  # 登录管理器
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command =
          "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --remember --remember-session --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
      };
    };
  };

  # 打印服务
  services.printing.enable = true;

  # 蓝牙管理
  services.blueman.enable = true;

  # 电源管理
  services.upower.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };

  # 键盘重映射
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = { main = { capslock = "f13"; }; };
      };
    };
  };

  # 音频服务
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # DNS 解析服务
  services.resolved.enable = true;

  # ============================================================================
  # 用户级服务
  # ============================================================================

  # Blueman applet 自动启动
  systemd.user.services.blueman-applet = {
    description = "Blueman applet";
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.blueman}/bin/blueman-applet";
      Restart = "on-failure";
      RestartSec = 3;
    };
  };

  # 自动解除蓝牙 rfkill 阻止
  systemd.services.bluetooth-unblock = {
    description = "Unblock Bluetooth";
    wantedBy = [ "multi-user.target" ];
    after = [ "bluetooth.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.util-linux}/bin/rfkill unblock bluetooth";
      RemainAfterExit = true;
    };
  };

  # ============================================================================
  # 程序配置
  # ============================================================================
  programs.zsh.enable = true;
  programs.dconf.enable = true;

  # 文件管理器
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];
  };

  # ============================================================================
  # 用户配置
  # ============================================================================
  users.users.manjack = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "manjack";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # ============================================================================
  # 系统包
  # ============================================================================
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # 完整的 TeX Live
    texlive.combined.scheme-full

    # PDF 查看器
    zathura

    # DVI/PS/PDF 转换工具（很多已包含在 texlive 中，但明确列出）
    texlive.combined.scheme-full # 已包含 dvipng, dvips 等

    # 图像处理核心工具
    imagemagick
    graphicsmagick

    # SVG 工具
    inkscape
    librsvg

    # DVI/PS/PDF 处理
    ghostscript # ps2pdf, ps2eps 等
    poppler_utils # pdftoppm, pdfimages, pdftocairo 等

    # 格式转换
    ffmpeg
    libwebp

    # 图像优化
    optipng
    jpegoptim
    pngquant

    # 查看器
    evince # PDF/PS/DVI 查看器
    feh # 图片查看器

    # 蓝牙工具
    bluez
    bluez-tools
    blueman

    # 文件管理
    xfce.thunar
    xfce.thunar-volman

    # 窗口管理器
    sway

    # 显示管理器
    kdePackages.sddm

    # 系统库
    stdenv.cc.cc.lib
    zlib
    openssl

    # 代理工具
    clash-verge-rev

    # Mermaid CLI
    mermaid-cli
  ];

  # ============================================================================
  # XDG 配置
  # ============================================================================
  xdg.mime.defaultApplications = { "inode/directory" = "thunar.desktop"; };

  # ============================================================================
  # Nix 配置
  # ============================================================================
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # ============================================================================
  # 系统版本
  # ============================================================================
  system.stateVersion = "25.05";

  # Home Manager 配置
  home-manager.backupFileExtension = "backup";
}
