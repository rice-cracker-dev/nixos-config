{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
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
    ./colorScheme
    ./rofi
    ./spicetify
  ];

  # set assets directory
  assetsDirectory = "${config.home.homeDirectory}/.config/assets/";

  # enable KDE connect
  services.kdeconnect.enable = true;

  # copy assets to config path
  home.file.${config.assetsDirectory} = {
    source = ../../assets;
    recursive = true;
  };
}
