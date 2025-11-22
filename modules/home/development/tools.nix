{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nwg-look
    crow-translate
    sioyek
    obsidian
    typora
    vscode
    spotify-cli-linux
    # Core tools
    vim
    wget
    curl
    unzip
    bat
    gnumake
    killall

    # Search and find
    ripgrep
    fd

    # LSP and code tools
    shellcheck
    taplo
    tree-sitter

    # Clipboard support
    wl-clipboard
    # xclip

    # Documentation and diagrams
    tectonic
    graphviz
    ghostscript
    mermaid-cli

    # Document processing (TeX)
    texliveFull
    zathura

    # Image processing
    imagemagick
    graphicsmagick
    inkscape
    librsvg
    ffmpeg
    libwebp
    optipng
    jpegoptim
    pngquant
    evince
    feh

    sqlite

    #xdg-utils
    xdotool
    # JSON processing
    jq

  ];
}
