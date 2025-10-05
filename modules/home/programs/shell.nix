{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = "source ~/.p10k.zsh";

    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "extract"
        "colored-man-pages"
        "command-not-found"
        "fzf"
        "history"
      ];
    };

    shellAliases = {
      ls = "eza --icons";
      la = "eza -la --icons";
      ll = "eza -l --icons";
      cd = "z";
      ff = "fastfetch";
      gaa = "git add all";
      ":q" = "exit";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      n = "nvim";
      lg = "lazygit";
    };

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [ "rm *" "pkill *" "cp *" ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    claude-code
    nix-search-cli
    tree
    fd
    fzf
    fastfetch
    zsh-powerlevel10k
    yazi
    eza
    copilot-cli
    awscli2
  ];
}
