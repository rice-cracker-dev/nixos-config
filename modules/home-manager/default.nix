{lib, ...}: {
  imports = [
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
    ./quickshell
    ./direnv
    ./vscode
    ./stylix
  ];

  # nix.settings = {
  #   substituters = ["https://cache.garnix.io"];
  #   trusted-public-keys = ["cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="];
  # };

  # enable KDE connect
  services.kdeconnect.enable = true;

  # enable modules
  ags.enable = lib.mkDefault true;
  foot.enable = lib.mkDefault true;
  gaming.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  keyring.enable = lib.mkDefault true;
  neovim-flake.enable = lib.mkDefault true;
  packages = {
    desktop.enable = lib.mkDefault true;
    dev.enable = lib.mkDefault true;
    tools.enable = lib.mkDefault true;
  };
  quickshell.enable = lib.mkDefault true;
  rofi.enable = lib.mkDefault true;
  shell.enable = lib.mkDefault true;
  spicetify.enable = lib.mkDefault true;
  direnv.enable = lib.mkDefault true;
  vscode.enable = lib.mkDefault true;
}
