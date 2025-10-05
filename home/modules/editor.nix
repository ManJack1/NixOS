{ config, pkgs, ... }:

{
  programs.neovim = {
    defaultEditor = true;
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Git 配置
  programs.git = {
    enable = true;
    userName = "Manjack";
    userEmail = "manjack0910@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

}
