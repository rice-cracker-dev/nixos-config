{inputs, pkgs, ...}: let
  agsPkgs = inputs.astal.packages.${pkgs.system};
in {
  wayland.windowManager.hyprland.settings.exec-once = ["ags"];

  programs.ags = {
    enable = true;
    configDir = ./config;

    extraPackages = [
      agsPkgs.network
      agsPkgs.wireplumber
      agsPkgs.bluetooth
      agsPkgs.battery
      agsPkgs.hyprland
      agsPkgs.tray
    ];
  };
}
