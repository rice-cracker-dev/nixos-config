{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./mangohud.nix
  ];

  options = {
    gaming.enable = lib.mkEnableOption "enable gaming";
  };

  config = lib.mkIf config.gaming.enable {
    home.packages = with pkgs; [
      # gaming
      lutris
      heroic
      wineWowPackages.waylandFull
      winetricks

      # games
      osu-lazer-bin
    ];
  };
}
