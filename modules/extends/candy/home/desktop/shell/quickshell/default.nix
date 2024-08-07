{pkgs, ...}: {
  home.packages = [pkgs.cava];

  quickshell = {
    enable = true;
    configPath = ./config;
  };
}
