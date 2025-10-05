# 🏠 Manjack's NixOS Configuration

A modular, declarative NixOS configuration using Flakes and Home Manager.

## ✨ Features

- 🎯 **Modular Architecture** - Clean separation of system and home configurations
- 🏡 **Home Manager** - Declarative user environment management
- 🪟 **Niri Window Manager** - Dynamic scrollable tiling with Wayland
- 🌏 **Chinese Support** - Complete i18n with Fcitx5 + Rime input
- 🎨 **Modern Desktop** - Rofi launcher, Waybar, custom theming
- 🛠️ **Developer Ready** - Multi-language toolchains and LSP support
- ⚡ **Performance Tuned** - TLP power management, PipeWire audio

## 📁 Structure

```
.
├── flake.nix                     # Flake entry point
├── hosts/
│   └── manjack/
│       ├── default.nix           # Host configuration
│       └── hardware-configuration.nix
├── modules/
│   ├── system/                   # System-level modules
│   │   ├── boot.nix
│   │   ├── locale.nix
│   │   ├── fonts.nix
│   │   ├── input-method.nix
│   │   ├── hardware.nix
│   │   └── services.nix
│   └── home/                     # Home Manager modules
│       ├── programs/
│       │   ├── shell.nix         # Zsh, Tmux
│       │   ├── terminal.nix      # Kitty, Alacritty
│       │   ├── editor.nix        # Neovim
│       │   └── git.nix
│       ├── desktop/
│       │   ├── wayland.nix       # Niri, Sway, Rofi
│       │   └── apps.nix          # Desktop applications
│       └── development/
│           ├── languages.nix     # Programming languages
│           └── tools.nix         # Dev utilities
├── home/
│   └── home.nix                  # Home Manager entry
└── config/                       # Application configs
    ├── kitty/
    ├── niri/
    ├── tmux/
    ├── rofi/
    └── zsh/
```

## 🚀 Installation

### Prerequisites

- NixOS installed
- Flakes enabled in `/etc/nixos/configuration.nix`:
  ```nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  ```

### Deploy

```bash
# Clone repository
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Customize hostname and username in flake.nix, home/home.nix, and hosts/manjack/default.nix

# Apply configuration
sudo nixos-rebuild switch --flake .#manjack

# Future updates
sudo nixos-rebuild switch --flake ~/.dotfiles
# Or use alias: update
```

## ⚙️ Configuration

### System

**Localization**
- Timezone: Asia/Shanghai
- System: en_US.UTF-8
- Locale: zh_CN.UTF-8
- Input: Fcitx5 + Rime

**Fonts**
- Code: Fira Code, JetBrains Mono, Maple Mono (Nerd Fonts)
- CJK: Source Han Sans/Serif, Noto CJK, LXGW WenKai
- Emoji: Noto Color Emoji

**Services**
- Audio: PipeWire
- Bluetooth: enabled by default
- Power: TLP
- Display: TuiGreet login manager
- Keyboard: CapsLock → F13

### Home Manager

**Shell** (`shell.nix`)
- Zsh + Oh-My-Zsh + Powerlevel10k
- Plugins: autosuggestions, syntax-highlighting
- Tools: fzf, zoxide, eza, ripgrep, fd, bat
- Tmux with Tokyo Night theme

**Terminal** (`terminal.nix`)
- Kitty (primary)
- Alacritty (backup)
- Yazi file manager

**Editor** (`editor.nix`)
- Neovim with custom config

**Desktop** (`wayland.nix`, `apps.nix`)
- WM: Niri (dynamic), Sway (tiling)
- Launcher: Rofi
- Bar: Waybar
- Apps: Firefox, Chrome, Spotify, Discord, Thunar
- Screenshots: Grim + Slurp

**Development** (`languages.nix`, `tools.nix`)
- Languages: Rust, C/C++, Python, Go, Ruby, PHP, Java, Julia, Lua
- LSP: clangd, rust-analyzer, taplo
- Tools: lazygit, claude-code, tree-sitter
- Docs: tectonic, graphviz, mermaid

## ⌨️ Keybindings

### Tmux

| Key | Action |
|-----|--------|
| `Ctrl-a` | Prefix |
| `Alt-w` | New window |
| `Alt-v` | Vertical split |
| `Alt-c` | Horizontal split |
| `Alt-,` / `Alt-.` | Previous/next window |
| `Alt-1~9` | Switch to window 1-9 |
| `Alt-h/j/k/l` | Resize pane |
| `Alt-q` | Close pane |
| `Ctrl-h/j/k/l` | Navigate panes (vim-style) |
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

## 🔧 Customization

### Change Hostname/Username

1. **flake.nix** - Update `nixosConfigurations.YOUR_HOST` and `home-manager.users.YOUR_USER`
2. **home/home.nix** - Set `home.username` and `home.homeDirectory`
3. **hosts/manjack/default.nix** - Change `networking.hostName` and `users.users.YOUR_USER`

### Add Packages

- **System packages**: Edit module files in `modules/system/`
- **User packages**: Edit module files in `modules/home/`

### Modify Configs

Application configs are in `config/` and can be edited directly.

## 🛠️ Tech Stack

- **OS**: NixOS Unstable (25.05)
- **Config Management**: Nix Flakes + Home Manager
- **Window Manager**: Niri (Wayland)
- **Terminal**: Kitty
- **Shell**: Zsh + Powerlevel10k
- **Multiplexer**: Tmux
- **Editor**: Neovim
- **Input Method**: Fcitx5 + Rime
- **Theme**: Tokyo Night

## 📝 Notes

- Requires NixOS 24.05+ with flakes enabled
- Home Manager backup extension: `.backup`
- Tmux plugins managed by TPM; install with `Prefix + I` on first run
- Niri window manager requires Wayland support

## 📄 License

MIT

---

⭐ Star this repo if you find it useful!
