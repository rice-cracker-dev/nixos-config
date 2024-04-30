{pkgs, ...}: {
  imports = [
    ./obs-studio
    ./spotify
  ];

  home.packages = with pkgs; [
    vesktop
    inkscape
  ];
}
