{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [inputs.hyprlock.homeManagerModules.default];

  config = lib.mkIf config.hyprland.enable {
    programs.hyprlock.enable = true;
  };
}
