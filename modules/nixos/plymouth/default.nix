{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    plymouth.enable = lib.mkEnableOption "enable plymouth";
  };

  config = lib.mkIf config.plymouth.enable {
    boot.plymouth.enable = true;
    boot.plymouth.theme = "nixos-bgrt";
    boot.plymouth.themePackages = [pkgs.nixos-bgrt-plymouth];
  };
}
