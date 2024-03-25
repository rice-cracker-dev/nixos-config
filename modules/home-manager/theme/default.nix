{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  # set global colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-macchiato;

  # generate colorScheme.scss
  home.file."${config.home.homeDirectory}/.config/colorScheme/style.scss".text = with config.colorScheme.palette; ''
    @define-color base00 #${base00};
    @define-color base01 #${base01};
    @define-color base02 #${base02};
    @define-color base03 #${base03};
    @define-color base04 #${base04};
    @define-color base05 #${base05};
    @define-color base06 #${base06};
    @define-color base07 #${base07};
    @define-color base08 #${base08};
    @define-color base09 #${base09};
    @define-color base0A #${base0A};
    @define-color base0B #${base0B};
    @define-color base0C #${base0C};
    @define-color base0D #${base0D};
    @define-color base0E #${base0E};
    @define-color base0F #${base0F};
  '';

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
      package = pkgs.catppuccin-gtk;
    };

    # gtk icon theme
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
}
