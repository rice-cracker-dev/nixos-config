{config, ...}: {
  imports = [./hyprpaper.nix];

  wayland.windowManager.hyprland.settings = {
    "$launcher" = "rofi -show drun";

    exec-once = ["quickshell"];

    general = with config.colorScheme.palette; {
      "col.inactive_border" = "rgba(${base03}ff)";
      "col.active_border" = "rgba(${base0D}ff)";
    };
  };
}
