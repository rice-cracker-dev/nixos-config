{ pkgs, ... }:

{
  # Enable the Hyprland Window Manager
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
}

