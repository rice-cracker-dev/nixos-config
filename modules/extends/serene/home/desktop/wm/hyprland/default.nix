{
  imports = [./hyprpaper.nix];

  wayland.windowManager.hyprland.settings = {
    "$launcher" = "ags -r 'toggleStartMenu()'";

    exec-once = [
      "ags"
    ];
  };
}
