{config, pkgs, lib, ...}: {
  imports = [./hyprpaper.nix];

  wayland.windowManager.hyprland.settings = {
    "$launcher" = "${lib.getExe pkgs.rofi-wayland} -show drun";

    general = with config.colorScheme.palette; {
      "col.inactive_border" = "rgba(${base03}ff)";
      "col.active_border" = "rgba(${base0D}ff)";
    };
  };
}
