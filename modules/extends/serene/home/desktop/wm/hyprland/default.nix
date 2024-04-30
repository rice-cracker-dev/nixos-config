{
  imports = [./hyprpaper.nix];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "ags"
    ];
  };
}
