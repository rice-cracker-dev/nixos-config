{
  self,
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  wallpaper = config.stylix.image;
  wallpaperPath = "${config.home.homeDirectory}/.local/share/hyprpaper/${builtins.baseNameOf wallpaper}";
in {
  config = lib.mkIf config.hyprland.enable {
    # install hyprpaper
    home.packages = [
      inputs.hyprpaper.packages.${pkgs.system}.hyprpaper
    ];

    # adding wallpaper
    home.file.${wallpaperPath}.source = wallpaper;

    # config hyprpaper
    home.file."${config.home.homeDirectory}/.config/hypr/hyprpaper.conf".text = ''
      preload = ${wallpaperPath}
      wallpaper = , ${wallpaperPath}
    '';
  };
}
