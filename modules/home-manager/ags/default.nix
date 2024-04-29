{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  options = {
    ags.enable = lib.mkEnableOption "enable ags";
  };

  # install sassc
  config = lib.mkIf config.ags.enable {
    home.packages = [
      pkgs.sassc
      pkgs.cava
    ];

    programs.ags = {
      enable = true;

      configDir = ./config;

      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
        libdbusmenu-gtk3
      ];
    };
  };
}
