_: {
  imports = [
    ../../modules/home-manager
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "khoa";
  home.homeDirectory = "/home/khoa";

  # env vars
  home.sessionVariables = {
    EDITOR = "nvim";

    NIXOS_OZONE_WL = "1";
  };

  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
