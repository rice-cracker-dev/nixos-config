{...}: {
  imports = [
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
  ];

  # nix settings
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      substituters = [
        "https://cache.garnix.io"
        "https://cuda-maintainers.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://ezkea.cachix.org"
      ];
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
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
}
