{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    keyring.enable = lib.mkEnableOption "keyring";
  };

  config = lib.mkIf config.keyring.enable {
    # enable gnome keyring
    services.gnome-keyring.enable = true;

    # install seahorse
    home.packages = with pkgs; [gnome.seahorse];
  };
}
