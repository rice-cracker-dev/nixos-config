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
    gtk = {
      enable = true;

      font = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
    };

    qt = {
      enable = true;

      platformTheme.name = "gtk";
    };
  };
}
