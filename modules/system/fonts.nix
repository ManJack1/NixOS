{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      # Western fonts
      nerd-fonts.iosevka
      noto-fonts-cjk-serif
      noto-fonts
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols

      # CJK fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      source-han-sans
      source-han-serif
      wqy_microhei
      wqy_zenhei

      # Maple Mono (Ligature TTF unhinted)
      maple-mono.truetype
      # Maple Mono NF (Ligature unhinted)
      maple-mono.NF-unhinted
      # Maple Mono NF CN (Ligature unhinted)
      maple-mono.NF-CN-unhinted
      lxgw-wenkai

      # Monospace fonts
      jetbrains-mono
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif CJK SC" "Noto Serif" ];
        sansSerif = [ "Noto Sans CJK SC" "Noto Sans" ];
        monospace = [ "JetBrains Mono" "Fira Code" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
