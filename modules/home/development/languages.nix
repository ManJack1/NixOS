{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust
    cargo
    rustc

    # C/C++
    gcc
    clang-tools
    cmake
    lldb

    # Python
    (python3.withPackages (ps: with ps; [ pynvim ]))
    python3Packages.pip

    # Node.js
    nodejs

    # Lua
    lua5_1
    luarocks-nix

    # Go
    go

    # Ruby
    ruby

    # PHP
    php
    phpPackages.composer

    # Java
    jdk

    # Julia
    julia

    nil
  ];

  home.sessionVariables = { NPM_CONFIG_PREFIX = "$HOME/.npm-global"; };

  home.sessionPath = [ "$HOME/.npm-global/bin" ];

}
