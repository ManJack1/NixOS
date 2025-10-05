{ config, pkgs, inputs, ... }:

{
  imports = [
    # Programs
    ../modules/home/programs/shell.nix
    ../modules/home/programs/terminal.nix
    ../modules/home/programs/editor.nix
    ../modules/home/programs/git.nix

    # Desktop
    ../modules/home/desktop/wayland.nix
    ../modules/home/desktop/apps.nix

    # Development
    ../modules/home/development/languages.nix
    ../modules/home/development/tools.nix

    # DankMaterialShell
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  home = {
    username = "manjack";
    homeDirectory = "/home/manjack";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
