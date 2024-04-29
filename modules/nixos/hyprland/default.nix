{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    # Enable the Hyprland Window Manager
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;

      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
  };
}
