{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust
    cargo
    rustc
    kdlfmt

    # C/C++
    gcc
    clang-tools
    cmake
    lldb

    # Python
    (python3.withPackages (ps:
      with ps; [
        pynvim
        epc
        sexpdata
        six
        inflect
        pyqt6
        pyqt6-sip

      ]))
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

    #nix
    nil
    nixpkgs-fmt
  ];

  home.sessionVariables = { NPM_CONFIG_PREFIX = "$HOME/.npm-global"; };

  home.sessionPath = [ "$HOME/.npm-global/bin" ];

}
