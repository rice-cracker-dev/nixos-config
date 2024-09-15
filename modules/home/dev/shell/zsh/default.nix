{
  imports = [./fzf-tab.nix];

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      bindkey '^[[127;5u' backward-kill-word
      bindkey '^[[3;5~' kill-word
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';
  };
}
