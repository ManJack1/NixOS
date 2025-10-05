{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust
    cargo
    rustc

    # C/C++
    clang
    cmake
    lldb

    # Python
    python3
    python3Packages.pip

    # Node.js
    nodejs

    # Lua
    luarocks

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
  ];
}
