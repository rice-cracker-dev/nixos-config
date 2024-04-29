{
  lib,
  config,
  ...
}: {
  options = {
    direnv.enable = lib.mkEnableOption "enable direnv";
  };

  config = lib.mkIf config.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;

      nix-direnv.enable = true;

      config = {
        global = {
          warn_timeout = 0;
        };
      };
    };
  };
}
