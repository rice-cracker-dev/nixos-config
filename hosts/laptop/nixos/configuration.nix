{
  username,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
    "${inputs.self}/modules/nixos"
    ./modules
    ./hardware-configuration.nix
  ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "storage" "power" "input" "docker" "libvirtd"];
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs username;};
    useGlobalPkgs = true;
    users.${username} = import ../home;
  };

  system.stateVersion = "24.05";
}
