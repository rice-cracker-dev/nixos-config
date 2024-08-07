{
  services.hyprpaper = let
    wallpaperDir = ./wallpapers;
  in {
    enable = true;

    settings = {
      splash = "false";

      preload = [
        "${wallpaperDir}/landscape3.png"
      ];

      wallpaper = [
        ",${wallpaperDir}/landscape3.png"
      ];
    };
  };
}
