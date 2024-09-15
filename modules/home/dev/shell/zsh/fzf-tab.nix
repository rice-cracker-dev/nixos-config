{pkgs, ...}: {
  programs.zsh.plugins = [
    {
      name = "fzf-tab";
      src = pkgs.zsh-fzf-tab;
      file = "share/fzf-tab/fzf-tab.plugin.zsh";
    }
  ];

  programs.zsh.initExtra = ''
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    zstyle ':completion:*:git-checkout:*' sort false
    zstyle ':completion:*:descriptions' format '[%d]'
    zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
    zstyle ':completion:*' menu no
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
    zstyle ':fzf-tab:*' switch-group '<' '>'
  '';
}
