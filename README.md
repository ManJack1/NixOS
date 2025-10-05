# 🏠 Manjack's NixOS Dotfiles

基于 NixOS Flakes 和 Home Manager 的个人系统配置。

A declarative NixOS configuration using Flakes and Home Manager for a complete desktop environment.

## ✨ 特性 | Features

- 🎯 **完全声明式配置** - 使用 NixOS Flakes 实现完整的系统可复现性
- 🏡 **Home Manager 集成** - 用户级配置管理
- 🪟 **双窗口管理器** - Niri (滚动式) 和 Sway (平铺式)
- 🌏 **中文本地化** - 完整的中文支持 + Fcitx5 输入法
- 🎨 **精心调优** - 蓝牙、电源管理、键盘重映射等
- 🛠️ **开发环境** - 包含多语言开发工具链
- 🎭 **现代化 Shell** - Zsh + Powerlevel10k + Tmux

## 📁 目录结构 | Directory Structure

```
.
├── flake.nix                  # Flake 入口文件
├── hosts/
│   └── manjack/
│       ├── configuration.nix  # 系统级配置
│       └── hardware-configuration.nix
├── home/
│   ├── home.nix              # Home Manager 主配置
│   └── modules/
│       ├── shell.nix         # Shell 配置 (Zsh, Tmux)
│       ├── editor.nix        # 编辑器配置 (Neovim, Git)
│       ├── desktop.nix       # 桌面环境和应用
│       └── dev.nix           # 开发工具和语言
└── config/
    ├── kitty/                # Kitty 终端配置
    ├── niri/                 # Niri 窗口管理器配置
    ├── sway/                 # Sway 窗口管理器配置
    ├── tmux/                 # Tmux 配置
    ├── rofi/                 # Rofi 启动器配置
    └── zsh/                  # Zsh 配置文件
```

## 🚀 快速开始 | Quick Start

### 前置要求 | Prerequisites

- NixOS 系统
- 启用 Flakes 支持

### 安装 | Installation

```bash
# 克隆仓库
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 首次安装（需要修改 hostname 和用户信息）
sudo nixos-rebuild switch --flake .#manjack

# 后续更新
sudo nixos-rebuild switch --flake ~/.dotfiles
# 或使用别名
update
```

## ⚙️ 配置详情 | Configuration Details

### 系统配置 | System Configuration

**本地化设置**
- 时区: Asia/Shanghai
- 系统语言: en_US.UTF-8
- 区域设置: zh_CN.UTF-8
- 输入法: Fcitx5 + Rime

**字体配置**
- 西文: Noto Fonts, Fira Code, JetBrains Mono
- 中文: Source Han Sans/Serif, Noto CJK, 霞鹜文楷, Maple Mono
- Emoji: Noto Color Emoji
- Nerd Fonts: JetBrains Mono, Fira Code

**硬件和服务**
- 蓝牙支持 (自动启动)
- 电源管理 (TLP)
- 音频服务 (PipeWire)
- 键盘重映射 (CapsLock → F13)
- 登录管理器 (TuiGreet)

### Home Manager 模块 | Home Manager Modules

#### Shell (shell.nix)

**Zsh 配置**
- 插件管理: Oh-My-Zsh
- 主题: Powerlevel10k
- 启用: 自动建议、语法高亮、命令补全
- 集成工具: fzf, zoxide

**Tmux 配置**
- 前缀键: `Ctrl-a`
- 主题: Tokyo Night
- 插件: sensible, vim-tmux-navigator
- 快捷键详见下方

**工具包含**
- 终端: Kitty, Alacritty, Yazi
- CLI 工具: eza, fd, ripgrep, lazygit, claude-code
- 系统工具: tree, fastfetch, awscli2

#### Editor (editor.nix)

- Neovim (默认编辑器)
- Git 配置
  - 用户: Manjack
  - 邮箱: manjack0910@gmail.com
  - 默认分支: main

#### Desktop (desktop.nix)

**窗口管理器和桌面工具**
- Niri (滚动式平铺)
- Sway (传统平铺)
- Rofi (应用启动器)
- Waybar (状态栏，可选)

**应用程序**
- 浏览器: Firefox, Google Chrome
- 文件管理: Thunar (主力)
- 娱乐: Spotify, Discord
- 截图: Grim + Slurp
- 系统: Brightnessctl, Playerctl, Pavucontrol

#### Dev (dev.nix)

**编程语言**
- Rust (cargo)
- C/C++ (clang, cmake, lldb)
- Python (python3, pip)
- Go, Ruby, PHP, Java, Julia, Lua

**开发工具**
- LSP: shellcheck, taplo, tree-sitter
- 文档: Tectonic (LaTeX), Graphviz, Mermaid
- 版本控制: Git, Lazygit

## 🎨 自定义配置 | Customization

### 修改主机名和用户

1. 编辑 `flake.nix`:
```nix
nixosConfigurations.YOUR_HOSTNAME = nixpkgs.lib.nixosSystem {
  # ...
  home-manager.users.YOUR_USERNAME = import ./home/home.nix;
}
```

2. 编辑 `home/home.nix`:
```nix
home.username = "YOUR_USERNAME";
home.homeDirectory = "/home/YOUR_USERNAME";
```

3. 编辑 `hosts/manjack/configuration.nix`:
```nix
networking.hostName = "YOUR_HOSTNAME";
users.users.YOUR_USERNAME = {
  # ...
};
```

### 添加/移除包

- 系统级包: 编辑 `hosts/manjack/configuration.nix` 中的 `environment.systemPackages`
- 用户级包: 编辑对应的 `home/modules/*.nix` 文件

## ⌨️ 快捷键参考 | Keyboard Shortcuts

### Tmux

| 快捷键 | 功能 |
|--------|------|
| `Ctrl-a` | 前缀键 |
| `Alt-w` | 新建窗口 |
| `Alt-v` | 垂直分割 |
| `Alt-c` | 水平分割 |
| `Alt-,` / `Alt-.` | 切换窗口 |
| `Alt-1~9` | 跳转到窗口 1-9 |
| `Alt-h/j/k/l` | 调整窗格大小 |
| `Alt-q` | 关闭窗格 |
| `Ctrl-h/j/k/l` | Vim 风格窗格导航 |
| `Prefix r` | 重载配置 |

### Shell 别名

```bash
ls     # eza --icons
la     # eza -la --icons
ll     # eza -l --icons
cd     # z (zoxide)
ff     # fastfetch
n      # nvim
lg     # lazygit
update # sudo nixos-rebuild switch --flake ~/.dotfiles
```

## 🛠️ 技术栈 | Tech Stack

- **操作系统**: NixOS (Unstable)
- **包管理**: Nix Flakes
- **用户配置**: Home Manager
- **窗口管理**: Niri / Sway (Wayland)
- **终端**: Kitty
- **Shell**: Zsh + Oh-My-Zsh + Powerlevel10k
- **终端复用**: Tmux
- **编辑器**: Neovim
- **输入法**: Fcitx5 + Rime
- **主题**: Tokyo Night

## 📝 说明 | Notes

- 本配置使用 NixOS 25.05 (Unstable)
- 需要启用实验性功能: `nix-command` 和 `flakes`
- Home Manager 使用备份扩展名 `.backup` 处理冲突
- Tmux 插件通过 TPM 管理，首次使用需按 `Prefix + I` 安装插件

## 🤝 贡献 | Contributing

欢迎提交 Issue 和 Pull Request！

Feel free to submit issues and pull requests!

## 📄 许可 | License

MIT License

---

⭐ 如果这个配置对你有帮助，欢迎 Star！

⭐ If you find this helpful, please give it a star!
