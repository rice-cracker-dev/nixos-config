{lib, ...}: {
  imports = [
    ./pipewire
    ./locale
    ./display-manager
    ./hyprland
    ./bootloader
    ./nvidia
    ./packages
    ./polkit
    ./networking
    ./pam
    ./plymouth
    ./ssh
    ./gaming
    ./virt-manager
    ./plasma
    ./stylix
    ./docker
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;

      substituters = [
        # "https://cache.garnix.io"
        "https://nixpkgs-unfree.cachix.org"
      ];
      trusted-public-keys = [
        # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
      ];
    };

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
  };

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable additional services
  services.upower.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
  services.uptimed.enable = true;

  # enable dconf
  programs.dconf.enable = true;
  programs.nix-ld.enable = true;

  # enable modules
  display-manager.enable = lib.mkDefault true;
  gaming.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  networking.enable = lib.mkDefault true;
  nvidia.enable = lib.mkDefault true;
  packages.fonts.enable = lib.mkDefault true;
  packages.gtk.enable = lib.mkDefault true;
  pam.enable = lib.mkDefault false;
  plymouth.enable = lib.mkDefault true;
  polkit.enable = lib.mkDefault true;
  pipewire.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault true;
  virt-manager.enable = lib.mkDefault true;
  plasma.enable = lib.mkDefault true;
  docker.enable = lib.mkDefault true;
}
