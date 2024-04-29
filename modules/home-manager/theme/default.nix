{
  pkgs,
  config,
  ...
}: {
  config = {
    gtk = {
      enable = true;

      # gtk icon theme
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };

      cursorTheme = {
        package = config.stylix.cursor.package;
        name = config.stylix.cursor.name;
        size = config.stylix.cursor.size;
      };
    };
  };
}
