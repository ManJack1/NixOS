{ config, pkgs, ... }: {
  programs.rofi = { enable = true; };

  programs.i3status-rust.enable = true;
  home.packages = with pkgs; [ wlr-randr wl-clipboard grim slurp ];
}
