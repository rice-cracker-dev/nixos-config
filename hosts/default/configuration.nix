{ config, pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
    inputs.home-manager.nixosModules.default
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable networking
  networking.networkmanager.enable = true; 
  networking.hostName = "nixos"; # Define your hostname.

  # Enable the X11 windowing system.
  services.xserver.enable = true;  

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.khoa = {
    isNormalUser = true;
    description = "khoa";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.  
  ];

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    users = {
      "khoa" = import ./home.nix;
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "23.11";
}
