{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.oh-my-posh.settings = builtins.fromTOML (builtins.readFile ./config.toml);
}
