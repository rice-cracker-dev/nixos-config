{
  config,
  lib,
  ...
}: {
  options = {
    pam.enable = lib.mkEnableOption "enable pam";
  };

  config = lib.mkIf config.pam.enable {
    # hyprlock specific
    security.pam.services.hyprlock = {};

    # unlock keyring
    security.pam.services.login.enableGnomeKeyring = true;
    # security.pam.services.sddm.enableGnomeKeyring = true;
  };
}
