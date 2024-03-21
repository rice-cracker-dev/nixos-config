{
  inputs,
  pkgs,
  config,
  ...
}: let
  wallpaper = ./wallpaper.png;
  wallpaperPath = "${config.home.homeDirectory}/.local/share/hyprpaper/${builtins.baseNameOf wallpaper}";
in {
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
}
