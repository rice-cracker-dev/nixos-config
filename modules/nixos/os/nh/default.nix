{username, ...}: {
  programs.nh = {
    enable = true;

    clean.enable = true;

    flake = "/home/${username}/nixos"; # please keep the config in ~/nixos
  };
}
