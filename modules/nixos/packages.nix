{ pkgs, ... }:

{
  # enable fonts
  fonts.fontconfig.enable = true;

  # packages
  fonts.packages = with pkgs; [
    # fonts
    (nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];
}

