{pkgs, ...}: {
  imports = [
    ./fonts.nix
  ];

  # system packages
  environment.systemPackages = with pkgs; [
    # cli tools
    curl
    wget
    killall
    tree
    fastfetch
    htop
    inotify-tools
    libnotify
    openssl

    # gtk
    glib
    gobject-introspection
    gtk4
    pkg-config
    wrapGAppsHook4
    libadwaita
    gdk-pixbuf
    gsettings-desktop-schemas
    librsvg
    pango
  ];
}
