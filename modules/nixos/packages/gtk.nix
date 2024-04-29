{
  config,
  pkgs,
  lib,
  ...
}: {
  options = {
    packages.gtk.enable = lib.mkEnableOption "enable gtk packages";
  };

  config = lib.mkIf config.packages.gtk.enable {
    environment.systemPackages = with pkgs; [
      # gtk
      glib
      gobject-introspection
      gtk3
      gtk4
      pkg-config
      wrapGAppsHook4
      libadwaita
      gdk-pixbuf
      gsettings-desktop-schemas
      librsvg
      pango
    ];
  };
}
