{ inputs, pkgs, config, ... }:

{
  # install hyprpaper
  home.packages = [
    inputs.hyprpaper.packages.${pkgs.system}.hyprpaper
  ];

  # config hyprpaper
  home.file."${config.home.homeDirectory}/.config/hypr/hyprpaper.conf".text = ''
    preload = ${config.assetsDirectory}/wallpaper.webp
    wallpaper = , ${config.assetsDirectory}/wallpaper.webp
  '';
}

