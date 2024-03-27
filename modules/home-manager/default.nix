{...}: {
  imports = [
    ../default.nix
    ./options
    ./hyprland
    ./theme
    ./shell
    ./packages
    ./git
    ./keyring
    ./foot
    ./ags
    ./neovim-flake
    ./rofi
    ./spicetify
    ./gaming
    ./fastfetch
    ./quickshell
  ];

  # enable KDE connect
  services.kdeconnect.enable = true;
}
