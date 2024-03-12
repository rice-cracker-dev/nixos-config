{pkgs, ...}: {
  # cursor
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;

    # enable gtk
    gtk.enable = true;
  };

  # enable qt
  qt.enable = true;

  # qt platform theme
  qt.platformTheme = "gtk";

  # qt style
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  # enable gtk
  gtk = {
    enable = true;

    # gtk theme
    theme = {
      name = "Catppuccin-Macchiato-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["mauve"];
        size = "standard";
        variant = "macchiato";
      };
    };

    # gtk icon theme
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
}
