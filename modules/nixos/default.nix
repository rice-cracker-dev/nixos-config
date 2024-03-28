{...}: {
  imports = [
    ../default.nix
    ./sound
    ./locale
    ./displayManager
    ./plasma
    ./hyprland
    ./bootloader
    ./nvidia
    ./packages
    ./polkit
    ./networking
    ./pam
    ./plymouth
    ./ssh
    ./plasma
    ./gaming
    ./virt-manager
    ./firewall
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
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
}
