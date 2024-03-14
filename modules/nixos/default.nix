{...}: {
  imports = [
    ./sound
    ./locale
    ./displayManager
    ./plasma
    ./hyprland
    ./bootloader
    ./nvidia
    ./packages
    ./polkit
    ./networking
    ./pam
    ./plymouth
  ];

  # enable additional services
  services.upower.enable = true;
  services.gvfs.enable = true;
}
