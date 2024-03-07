{ pkgs, ... }:

{
  # enable gnome keyring
  services.gnome-keyring.enable = true;

  # install seahorse
  home.packages = with pkgs; [ gnome.seahorse ];
}

