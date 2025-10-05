{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      # Western fonts
      noto-fonts
      noto-fonts-emoji
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
