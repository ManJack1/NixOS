# 🏠 Manjack's NixOS Dotfiles

A personal system configuration based on NixOS Flakes and Home Manager.

A declarative NixOS configuration using Flakes and Home Manager for a complete desktop environment.

## ✨ Features

- 🎯 **Fully Declarative Configuration** - Complete system reproducibility with NixOS Flakes
- 🏡 **Home Manager Integration** - User-level configuration management
- 🪟 **Dual Window Managers** - Niri (dynamic) and Sway (tiling)
- 🌏 **Chinese Localization** - Full Chinese support + Fcitx5 input method
- 🎨 **Fine-tuned** - Bluetooth, power management, keyboard remapping, etc.
- 🛠️ **Development Environment** - Multi-language toolchains included
- 🎭 **Modern Shell** - Zsh + Powerlevel10k + Tmux

## 📁 Directory Structure

```
.
├── flake.nix                  # Flake entry point
├── hosts/
│   └── manjack/
│       ├── configuration.nix  # System configuration
│       └── hardware-configuration.nix
├── home/
│   ├── home.nix              # Home Manager main config
│   └── modules/
│       ├── shell.nix         # Shell config (Zsh, Tmux)
│       ├── editor.nix        # Editor config (Neovim, Git)
│       ├── desktop.nix       # Desktop environment & apps
│       └── dev.nix           # Dev tools & languages
└── config/
    ├── kitty/                # Kitty terminal config
    ├── niri/                 # Niri WM config
    ├── sway/                 # Sway WM config
    ├── tmux/                 # Tmux config
    ├── rofi/                 # Rofi launcher config
    └── zsh/                  # Zsh config files
```

## 🚀 Quick Start

### Prerequisites

- NixOS system
- Flakes support enabled

### Installation

```bash
# Clone the repo
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# First install (edit hostname and user info)
sudo nixos-rebuild switch --flake .#manjack

# Update later
sudo nixos-rebuild switch --flake ~/.dotfiles
# Or use alias
update
```

## ⚙️ Configuration Details

### System Configuration

**Localization**
- Timezone: Asia/Shanghai
- System language: en_US.UTF-8
- Locale: zh_CN.UTF-8
- Input method: Fcitx5 + Rime

**Fonts**
- Western: Noto Fonts, Fira Code, JetBrains Mono
- Chinese: Source Han Sans/Serif, Noto CJK, LXGW WenKai, Maple Mono
- Emoji: Noto Color Emoji
- Nerd Fonts: JetBrains Mono, Fira Code

**Hardware & Services**
- Bluetooth support (auto start)
- Power management (TLP)
- Audio service (PipeWire)
- Keyboard remap (CapsLock → F13)
- Login manager (TuiGreet)

### Home Manager Modules

#### Shell (shell.nix)

**Zsh**
- Plugin manager: Oh-My-Zsh
- Theme: Powerlevel10k
- Enabled: autosuggestions, syntax highlighting, completion
- Integrated tools: fzf, zoxide

**Tmux**
- Prefix key: `Ctrl-a`
- Theme: Tokyo Night
- Plugins: sensible, vim-tmux-navigator
- See shortcuts below

**Included Tools**
- Terminal: Kitty, Alacritty, Yazi
- CLI tools: eza, fd, ripgrep, lazygit, claude-code
- System tools: tree, fastfetch, awscli2

#### Editor (editor.nix)

- Neovim (default editor)
- Git config
  - User: Manjack
  - Email: manjack0910@gmail.com
  - Default branch: main

#### Desktop (desktop.nix)

**Window Managers & Desktop Tools**
- Niri (dynamic tiling)
- Sway (classic tiling)
- Rofi (app launcher)
- Waybar (optional status bar)

**Applications**
- Browser: Firefox, Google Chrome
- File manager: Thunar (main)
- Entertainment: Spotify, Discord
- Screenshot: Grim + Slurp
- System: Brightnessctl, Playerctl, Pavucontrol

#### Dev (dev.nix)

**Languages**
- Rust (cargo)
- C/C++ (clang, cmake, lldb)
- Python (python3, pip)
- Go, Ruby, PHP, Java, Julia, Lua

**Dev Tools**
- LSP: shellcheck, taplo, tree-sitter
- Docs: Tectonic (LaTeX), Graphviz, Mermaid
- VCS: Git, Lazygit

## 🎨 Customization

### Change Hostname & User

1. Edit `flake.nix`:
```nix
nixosConfigurations.YOUR_HOSTNAME = nixpkgs.lib.nixosSystem {
  # ...
  home-manager.users.YOUR_USERNAME = import ./home/home.nix;
}
```

2. Edit `home/home.nix`:
```nix
home.username = "YOUR_USERNAME";
home.homeDirectory = "/home/YOUR_USERNAME";
```

3. Edit `hosts/manjack/configuration.nix`:
```nix
networking.hostName = "YOUR_HOSTNAME";
users.users.YOUR_USERNAME = {
  # ...
};
```

### Add/Remove Packages

- System packages: Edit `environment.systemPackages` in `hosts/manjack/configuration.nix`
- User packages: Edit the relevant `home/modules/*.nix` file

## ⌨️ Keyboard Shortcuts

### Tmux

| Shortcut | Function |
|----------|----------|
| `Ctrl-a` | Prefix key |
| `Alt-w`  | New window |
| `Alt-v`  | Vertical split |
| `Alt-c`  | Horizontal split |
| `Alt-,` / `Alt-.` | Switch window |
| `Alt-1~9` | Jump to window 1-9 |
| `Alt-h/j/k/l` | Resize pane |
| `Alt-q`  | Close pane |
| `Ctrl-h/j/k/l` | Vim-style pane navigation |
| `Prefix r` | Reload config |

### Shell Aliases

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

## 🛠️ Tech Stack

- **OS**: NixOS (Unstable)
- **Package Manager**: Nix Flakes
- **User Config**: Home Manager
- **Window Manager**: Niri / Sway (Wayland)
- **Terminal**: Kitty
- **Shell**: Zsh + Oh-My-Zsh + Powerlevel10k
- **Terminal Multiplexer**: Tmux
- **Editor**: Neovim
- **Input Method**: Fcitx5 + Rime
- **Theme**: Tokyo Night

## 📝 Notes

- This config uses NixOS 25.05 (Unstable)
- Experimental features required: `nix-command` and `flakes`
- Home Manager uses `.backup` extension for conflict backups
- Tmux plugins managed by TPM; press `Prefix + I` to install plugins on first use

## 🤝 Contributing

Feel free to submit issues and pull requests!

## 📄 License

MIT License

---

⭐ If you find this helpful, please give it a star!
