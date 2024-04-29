{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    packages.tools.enable = lib.mkEnableOption "enable tools packages";
  };

  config = lib.mkIf config.packages.tools.enable {
    home.packages = with pkgs; [
      jetbrains-toolbox
      putty
      blender
    ];
  };
}
