{
  inputs,
  pkgs,
  ...
}: let
  spicetifyPkg = inputs.spicetify.packages.${pkgs.system}.default;
in {
  imports = [inputs.spicetify.homeManagerModules.default];

  programs.spicetify = {
    enable = true;
    theme = spicetifyPkg.themes.catppuccin;
    colorScheme = "macchiato";
  };
}
