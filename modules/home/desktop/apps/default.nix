{pkgs, ...}: {
  imports = [
    ./obs-studio
    ./spotify
  ];

  home.packages = with pkgs; [
    vesktop
    inkscape
    networkmanagerapplet
    vlc
    qbittorrent
    # libreoffice-qt
    krita
    figma-linux
    electrum
    gparted
  ];
}
