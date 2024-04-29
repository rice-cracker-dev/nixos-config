{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  spicetifyPkg = inputs.spicetify.packages.${pkgs.system}.default;
in {
  imports = [inputs.spicetify.homeManagerModules.default];

  options = {
    spicetify.enable = lib.mkEnableOption "enable spicetify";
  };

  config = lib.mkIf config.spicetify.enable {
    programs.spicetify = {
      enable = true;
      theme = spicetifyPkg.themes.catppuccin;
      colorScheme = "macchiato";
    };
  };
}
