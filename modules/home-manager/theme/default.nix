{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./files.nix
  ];

  # set global colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  # cursor
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;

    # enable gtk
    gtk.enable = true;
  };

  # enable qt
  qt = {
    enable = true;

    # qt platform theme
    platformTheme = "gtk";

    # qt style
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  # enable gtk
  gtk = {
    enable = true;

    # gtk theme
    theme = {
      name = "Catppuccin-Macchiato-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["mauve"];
        size = "standard";
        tweaks = ["normal"];
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
