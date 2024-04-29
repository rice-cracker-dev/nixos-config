{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    # install hyprpicker
    home.packages = [
      inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    ];
  };
}
