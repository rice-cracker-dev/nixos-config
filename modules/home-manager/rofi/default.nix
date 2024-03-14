{
  pkgs,
  config,
  inputs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "JetBrains Mono 12";
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
      inherit (inputs.nix-colors.lib-core.conversions) hexToRGBString;

      palette = config.colorScheme.palette;

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
        border-color = mkLiteral ''rgba(${hexToRGBString "," palette.base05}, 0.25)'';
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
      "#element.selected" = {background-color = mkLiteral "#${palette.base0E}";};
      "#element-text.selected" = {text-color = mkLiteral "#${palette.base00}";};
    };
  };
}
