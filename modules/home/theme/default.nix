{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./styles.nix
  ];

  options.accent = lib.mkOption {
    type = lib.types.str;
    description = "accent color";
    default = "base0E";
  };

  config = {
    home.packages = [
      pkgs.libsForQt5.qt5ct
      pkgs.qt6ct
      pkgs.nwg-look
    ];

    gtk = {
      enable = true;

      font = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "qtct";
    };
  };
}
