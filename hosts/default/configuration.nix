{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  # nix settings
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      substituters = [
        "https://cache.garnix.io"
        "https://cuda-maintainers.cachix.org"
      ];
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
    
  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable the x11 windowing system.
  services.xserver.enable = true;

  # enable the zsh shell
  programs.zsh.enable = true;

  # set default user shell
  users.defaultUserShell = pkgs.zsh;

  # define my main user account
  users.users.khoa = {
    isNormalUser = true;
    description = "khoa";
    extraGroups = [ "networkmanager" "wheel" ];
  }; 

  # set home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    users = {
      "khoa" = import ./home.nix;
    };
  };

  # enable the ssh daemon.
  services.openssh.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
