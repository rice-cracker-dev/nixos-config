{ pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      bind = [
        "SUPER, return, exec, kitty"
      ];
    };
  };
}
