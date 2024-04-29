{pkgs, ...}: {
  imports = [
    ./targets.nix
    ./files.nix
  ];

  config.stylix = {
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
    };

    opacity = {
      applications = 0.75;
      desktop = 0.75;
      popups = 0.75;
      terminal = 0.5;
    };
  };
}
