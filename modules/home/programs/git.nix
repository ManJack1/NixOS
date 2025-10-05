{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Manjack";
    userEmail = "manjack0910@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.lazygit.enable = true;

  home.packages = with pkgs; [
    git
    lazygit
  ];
}
