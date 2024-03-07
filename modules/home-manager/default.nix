{ ... }:

{
  imports = [
    ./hyprland
    ./theme
    ./shell
    ./packages
    ./git
    ./keyring
  ];

  # enable KDE connect
  services.kdeconnect.enable = true;
}
