{
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify.packages.${pkgs.system}.default;
in {
  imports = [inputs.spicetify.homeManagerModules.default];

  programs.spicetify = {
    enable = false;

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
    ];
  };
}
