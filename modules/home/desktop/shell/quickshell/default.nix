{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  options.quickshell = {
    enable = lib.mkEnableOption "quickshell";

    configPath = lib.mkOption {
      type = lib.types.path;
      description = "";
    };
  };

  config = lib.mkIf config.quickshell.enable {
    home.packages = [
      inputs.quickshell.packages.${pkgs.system}.default
      pkgs.qt5.qtquickcontrols
    ];

    xdg.configFile.quickshell = {
      source = config.quickshell.configPath;
      recursive = true;
    };
  };
}
