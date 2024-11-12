{pkgs, ...}: {
  home.packages = with pkgs; [
    unrar
    unzip
    p7zip
    xarchiver
  ];
}
