{pkgs, ...}: {
  home.packages = with pkgs; [
    vesktop
    inkscape
  ];
}
