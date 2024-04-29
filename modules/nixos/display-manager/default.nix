{
  config,
  lib,
  ...
}: {
  options = {
    display-manager.enable = lib.mkEnableOption "enable display-manager";
  };

  config = lib.mkIf config.display-manager.enable {
    # sddm
    services.displayManager.sddm = {
      # enable sddm
      enable = true;

      # enable experimental wayland support
      wayland.enable = true;

      # theme
      # theme = "${import ./catppuccin.nix { inherit pkgs; }}";
    };
  };
}
