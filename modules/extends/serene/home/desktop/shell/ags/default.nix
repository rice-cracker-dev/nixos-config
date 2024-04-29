{pkgs, ...}: {
  home.packages = with pkgs; [
    libdbusmenu-gtk3
    cava
  ];

  programs.ags = {
    enable = true;

    configDir = ./config;

    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
      libdbusmenu-gtk3
    ];
  };
}
