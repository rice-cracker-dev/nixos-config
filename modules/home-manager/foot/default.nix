{
  config,
  lib,
  ...
}: {
  options = {
    foot.enable = lib.mkEnableOption "enable foot";
  };

  config = lib.mkIf config.foot.enable {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          font = with config.stylix.fonts; "${monospace.name}:size=${toString sizes.terminal}";
          dpi-aware = "no";
        };

        colors = with config.lib.stylix.colors; {
          alpha = config.stylix.opacity.terminal;
          background = "000000";
          foreground = base05;
          regular0 = base00; # black
          regular1 = base08; # red
          regular2 = base0B; # green
          regular3 = base0A; # yellow
          regular4 = base0D; # blue
          regular5 = base0E; # magenta
          regular6 = base0C; # cyan
          regular7 = base05; # white
          bright0 = base03; # bright black
          bright1 = base08; # bright red
          bright2 = base0B; # bright green
          bright3 = base0A; # bright yellow
          bright4 = base0D; # bright blue
          bright5 = base0E; # bright magenta
          bright6 = base0C; # bright cyan
          bright7 = base07; # bright white
          "16" = base09;
          "17" = base0F;
          "18" = base01;
          "19" = base02;
          "20" = base04;
          "21" = base06;
        };
      };
    };
  };
}
