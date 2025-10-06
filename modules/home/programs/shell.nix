{ config, pkgs, ... }:

{

  programs.starship = { enable = true; };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = "\nbindkey -r '^[c' \n      ";

    # plugins = [{
    #   name = "powerlevel10k";
    #   src = pkgs.zsh-powerlevel10k;
    #   file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    # }];

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
      cdf =
        "cd $(fd -tf -H | fzf --preview 'bat --color=always {}' | xargs dirname)";
      cf =
        "cd $(fd --type d -H | fzf --preview 'eza -lah --color=always --icons {} 2>/dev/null || ls -lah --color=always {}' --preview-window=right:60%)";
      vf =
        "nvim $(fzf --preview 'bat --color=always --style=numbers {}' --preview-window=right:60%)";
      ff =
        "fd -t f -H . ~ | fzf --preview 'bat --color=always --style=numbers --line-range :500 {}' --preview-window=right:60% --height=90% --border | xargs realpath | wl-copy";
      ls = "eza --icons";
      la = "eza -la --icons";
      ll = "eza -l --icons";
      cd = "z";
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
    awscli2
    zellij
  ];
}
