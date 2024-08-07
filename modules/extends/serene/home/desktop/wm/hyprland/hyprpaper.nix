{
  services.hyprpaper = let
    wallpaperDir = ./wallpapers;
  in {
    enable = true;

    settings = {
      splash = "false";

      preload = [
        "${wallpaperDir}/hypr95.png"
      ];

      wallpaper = [
        ",${wallpaperDir}/hypr95.png"
      ];
    };
  };
}
