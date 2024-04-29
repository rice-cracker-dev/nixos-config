{
  lib,
  config,
  ...
}: {
  options = {
    git.enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;

      # set username and email
      userEmail = "ricecracker2234@outlook.com";
      userName = "rice-cracker-dev";
    };

    # github cli
    programs.gh.enable = true;
  };
}
