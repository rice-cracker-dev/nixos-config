{pkgs, ...}: {
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
  };
}
