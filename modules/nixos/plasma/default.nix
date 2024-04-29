{
  config,
  lib,
  ...
}: {
  options = {
    plasma.enable = lib.mkEnableOption "plasma";
  };

  config = lib.mkIf config.plasma.enable {
    services.desktopManager.plasma6 = {
      enable = true;
    };
  };
}
