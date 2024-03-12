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

  services.upower.enable = true;
}
