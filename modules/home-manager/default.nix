{...}: {
  imports = [
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
    ./mako
  ];

  # enable KDE connect
  services.kdeconnect.enable = true;
}
