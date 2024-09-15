{
  config,
  lib,
  ...
}: {
  programs.rofi = {
    font = "JetBrainsMono Nerd Font 12";

    extraConfig = {
      show-icons = true;
      hover-select = true;
      display-drun = "Search:";
    };
  };

  programs.rofi.theme = let
    inherit (config.lib.formats.rasi) mkLiteral;
    inherit (config.colorScheme) palette;

    card = {
      background-color = mkLiteral "#${palette.base00}bf";
      color = mkLiteral "#${palette.base05}";
      border-radius = mkLiteral "8px";
      padding = mkLiteral "8px";
      spacing = mkLiteral "2px";
    };

    label = color: {
      background-color = mkLiteral "transparent";
      color = mkLiteral color;
    };
  in {
    "#window" = {
      background-color = mkLiteral "transparent";
      padding = mkLiteral "0px";
    };

    "#mainbox" = {
      background-color = mkLiteral "transparent";
      spacing = mkLiteral "8px";
    };

    "#prompt" = label "#${palette.base05}bf";
    "#entry" = label "#${palette.base05}";
    "#case-indicator" = label "#${palette.base05}bf";

    "#inputbar" = lib.attrsets.mergeAttrsList [card {spacing = mkLiteral "4px";}];
    "#message" = card;
    "#listview" = card;
    "#mode-switcher" = card;

    "#element" = {
      background-color = mkLiteral "transparent";
      border-radius = mkLiteral "4px";
      padding = mkLiteral "4px";
      spacing = mkLiteral "8px";
    };

    "#element.selected" = {
      background-color = mkLiteral "#${palette.base0D}";
    };

    "#element-text" = {
      background-color = mkLiteral "transparent";
      color = mkLiteral "#${palette.base05}";
    };

    "#element-text.selected" = {color = mkLiteral "#${palette.base00}";};

    "#element-icon" = {background-color = mkLiteral "transparent";};
  };
}
