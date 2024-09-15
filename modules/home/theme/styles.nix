{config, ...}: {
  xdg.configFile = let
    json = with config.colorScheme.palette; ''
      {
        "base00": "${base00}",
        "base01": "${base01}",
        "base02": "${base02}",
        "base03": "${base03}",
        "base04": "${base04}",
        "base05": "${base05}",
        "base06": "${base06}",
        "base07": "${base07}",
        "base08": "${base08}",
        "base09": "${base09}",
        "base0A": "${base0A}",
        "base0B": "${base0B}",
        "base0C": "${base0C}",
        "base0D": "${base0D}",
        "base0E": "${base0E}",
        "base0F": "${base0F}",
        "accent": "${config.colorScheme.palette.${config.accent}}",
      }
    '';
  in {
    "schemes/style.css".text = with config.colorScheme.palette; ''
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
      @define-color accent #${config.colorScheme.palette.${config.accent}};
    '';

    "schemes/style.scss".text = with config.colorScheme.palette; ''
      $base00: #${base00};
      $base01: #${base01};
      $base02: #${base02};
      $base03: #${base03};
      $base04: #${base04};
      $base05: #${base05};
      $base06: #${base06};
      $base07: #${base07};
      $base08: #${base08};
      $base09: #${base09};
      $base0A: #${base0A};
      $base0B: #${base0B};
      $base0C: #${base0C};
      $base0D: #${base0D};
      $base0E: #${base0E};
      $base0F: #${base0F};
      $accent: #${config.colorScheme.palette.${config.accent}};
    '';

    "schemes/colors.json".text = json;
    "schemes/colors.mjs".text = "export default ${json}";
  };
}
