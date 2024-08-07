{
  imports = [
    ./flatpak
    ./locale
    ./networking
    ./nh
    ./piper
  ];

  services.gvfs.enable = true;
  programs.nix-ld.enable = true;
}
