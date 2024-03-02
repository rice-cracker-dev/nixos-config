{ ... }:

{
  # zsh
  programs.zsh = {
    # enable zsh
    enable = true;
    
    # enable oh-my-zsh
    # programs.oh-my-zsh.enable = true;

    # enable plugins
    enableCompletion = true;
    enableAutosuggestions = true;
  };

  # starship
  programs.starship = {
    # enable starship
    enable = true;
    enableZshIntegration = true;
  };
}

