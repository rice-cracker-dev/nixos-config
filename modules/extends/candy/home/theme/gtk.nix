{pkgs, ...}: {
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "catppuccin-mocha-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = ["mauve"];
        variant = "mocha";
      };
    };
  };
}
