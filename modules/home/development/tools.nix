{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core tools
    vim
    wget
    curl
    unzip

    # Search and find
    ripgrep
    fd

    # LSP and code tools
    shellcheck
    taplo
    tree-sitter

    # Clipboard support
    wl-clipboard
    xclip

    # Documentation and diagrams
    tectonic
    graphviz
    ghostscript
    mermaid-cli

    # Document processing (TeX)
    texlive.combined.scheme-full
    zathura

    # Image processing
    imagemagick
    graphicsmagick
    inkscape
    librsvg
    poppler_utils
    ffmpeg
    libwebp
    optipng
    jpegoptim
    pngquant
    evince
    feh

    # JSON processing
    jq
  ];
}
