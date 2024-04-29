{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  options = {
    quickshell.enable = lib.mkEnableOption "enable quickshell";
  };

  config = lib.mkIf config.quickshell.enable {
    home.packages = [
      inputs.quickshell.packages.${pkgs.system}.default
    ];

    home.file."${config.home.homeDirectory}/.config/quickshell" = {
      source = ./config;
      recursive = true;
    };
  };
}
