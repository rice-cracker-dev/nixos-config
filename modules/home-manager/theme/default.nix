{ pkgs, ... }:

{


  # enable qt
  qt.enable = true;
  
  # qt platform theme
  qt.platformTheme = "gtk";

  # qt style
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;

  # enable gtk
  gtk.enable = true;

  # gtk cursor
  # gtk.cursorTheme.package =
  # gtk.cursorTheme.name = 

  # gtk theme
  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";

  # gtk icon theme
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";
}

