{pkgs, ...}: {
  home.packages = with pkgs; [
    libdbusmenu-gtk3
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
