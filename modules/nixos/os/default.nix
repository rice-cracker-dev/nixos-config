{pkgs, ...}: {
  imports = [
    ./flatpak
    ./kernel
    ./keyring
    ./locale
    ./networking
    ./nh
    ./piper
    ./secrets
  ];

  environment.systemPackages = [pkgs.util-linux];

  services.gvfs.enable = true;
  programs.nix-ld.enable = true;
}
