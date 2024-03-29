{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

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
    extraGroups = [
      "networkmanager"
      "wheel"
      "storage"
      "power"
      "libvirtd"
      "kvm"
      "input"
    ];
  };

  # set home manager
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    users = {
      "khoa" = import ./home.nix;
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
