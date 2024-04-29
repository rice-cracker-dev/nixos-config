{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    gaming.enable = lib.mkEnableOption "gaming";
  };

  config = lib.mkIf config.gaming.enable {
    programs.steam = {
      enable = true;

      extraCompatPackages = [pkgs.proton-ge-bin];
    };

    programs.gamemode.enable = true;
  };
}
