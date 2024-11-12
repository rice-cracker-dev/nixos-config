{pkgs, ...}: {
  imports = [
    ./bluetooth
    ./dconf
    ./display-manager
    ./fonts
    ./hyprland
    ./polkit
    ./sound
    ./steam
    ./virtualisation
    ./x11
    ./xfce
  ];

  environment.systemPackages = [pkgs.wl-clipboard];
}
