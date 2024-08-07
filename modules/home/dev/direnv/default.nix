{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;

    config = {
      global = {
        warn_timeout = 0;
      };
    };
  };
}
