{ ... }:

{
  # sddm
  services.xserver.displayManager.sddm = {
    # enable sddm
    enable = true;

    # enable experimental wayland support
    wayland.enable = true;
  };

  # unlock keyring
  security.pam.services.login.enableGnomeKeyring = true;
  # security.pam.services.sddm.enableGnomeKeyring = true;
} 

