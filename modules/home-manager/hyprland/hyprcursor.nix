{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    home.packages = [inputs.hyprcursor.packages.${pkgs.system}.hyprcursor];
  };
}
