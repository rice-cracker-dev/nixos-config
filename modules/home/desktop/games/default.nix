{pkgs, ...}: {
  imports = [./minecraft];

  home.packages = with pkgs; [
    protonup-qt
    lutris
    wineWowPackages.waylandFull
    winetricks
  ];
}
