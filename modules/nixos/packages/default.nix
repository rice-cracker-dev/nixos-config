{pkgs, ...}: {
  imports = [
    ./fonts
  ];

  # system packages
  environment.systemPackages = with pkgs; [
    # cli tools
    curl
    wget
    killall
    tree
    fastfetch
    pfetch
    btop
    jq
    inotify-tools
    libnotify
    libsixel
    openssl
    unzip
    unrar
    p7zip

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
}
