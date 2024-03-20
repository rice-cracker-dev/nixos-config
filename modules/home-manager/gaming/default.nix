{pkgs, ...}: {
  imports = [
    ./mangohud.nix
  ];

  home.packages = with pkgs; [
    # gaming
    lutris
    heroic
    wineWowPackages.waylandFull
    winetricks
  ];
}
