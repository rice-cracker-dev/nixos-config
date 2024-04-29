{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    rofi.enable = lib.mkEnableOption "enable rofi";
  };

  config = lib.mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      font = with config.stylix.fonts; "${monospace.name} ${toString sizes.terminal}";
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;

        palette = config.lib.stylix.colors;

        card = {
          background-color = mkLiteral "rgba(0, 0, 0, 0.5)";
          border = mkLiteral "1px solid";
          border-radius = mkLiteral "4px";
          padding = mkLiteral "8px";
        };
      in {
        "*" = {
          background-color = mkLiteral "transparent";
          foreground-color = mkLiteral "#${palette.base05}";
          text-color = mkLiteral "#${palette.base05}";
          border-color = with palette; mkLiteral "rgba(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b}, 0.25)";
        };

        "#window" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${palette.base05}";
        };

        "#mainbox" = {
          background-color = mkLiteral "transparent";
          spacing = mkLiteral "8px";
        };

        "#element" = {
          padding = mkLiteral "4px";
          border-radius = mkLiteral "4px";
        };

        "#inputbar" = card // {spacing = mkLiteral "8px";};
        "#listview" = card;
        "#element.selected" = {background-color = mkLiteral "#${palette.base0A}";};
        "#element-text.selected" = {text-color = mkLiteral "#${palette.base00}";};
      };
    };
  };
}
