{
  config,
  builtins,
  ...
}: {
  programs.helix.themes.base16 = {
    attributes = "base09";
    comment = {
      fg = "base03";
      modifiers = ["italic"];
    };
    constant = "base09";
    "constant.character.escape" = "base0C";
    "constant.numeric" = "base09";
    constructor = "base0D";
    debug = "base03";
    diagnostic = {modifiers = ["underlined"];};
    "diagnostic.error" = {underline = {style = "curl";};};
    "diagnostic.hint" = {underline = {style = "curl";};};
    "diagnostic.info" = {underline = {style = "curl";};};
    "diagnostic.warning" = {underline = {style = "curl";};};
    "diff.delta" = "base09";
    "diff.minus" = "base08";
    "diff.plus" = "base0B";
    error = "base08";
    function = "base0D";
    hint = "base03";
    info = "base0D";
    keyword = "base0E";
    label = "base0E";
    "markup.bold" = {
      fg = "base0A";
      modifiers = ["bold"];
    };
    "markup.heading" = "base0D";
    "markup.italic" = {
      fg = "base0E";
      modifiers = ["italic"];
    };
    "markup.link.text" = "base08";
    "markup.link.url" = {
      fg = "base09";
      modifiers = ["underlined"];
    };
    "markup.list" = "base08";
    "markup.quote" = "base0C";
    "markup.raw" = "base0B";
    "markup.strikethrough" = {modifiers = ["crossed_out"];};
    namespace = "base0E";
    operator = "base05";
    special = "base0D";
    string = "base0B";
    type = "base0A";
    "ui.background" = {bg = "base00";};
    "ui.bufferline" = {
      bg = "base00";
      fg = "base04";
    };
    "ui.bufferline.active" = {
      bg = "base03";
      fg = "base00";
      modifiers = ["bold"];
    };
    "ui.cursor" = {
      fg = "base0A";
      modifiers = ["reversed"];
    };
    "ui.cursor.insert" = {
      fg = "base0A";
      modifiers = ["reversed"];
    };
    "ui.cursor.match" = {
      fg = "base0A";
      modifiers = ["reversed"];
    };
    "ui.cursor.select" = {
      fg = "base0A";
      modifiers = ["reversed"];
    };
    "ui.cursorline.primary" = {
      bg = "base01";
      fg = "base05";
    };
    "ui.gutter" = {bg = "base00";};
    "ui.help" = {
      bg = "base01";
      fg = "base06";
    };
    "ui.linenr" = {
      bg = "base00";
      fg = "base03";
    };
    "ui.linenr.selected" = {
      bg = "base01";
      fg = "base04";
      modifiers = ["bold"];
    };
    "ui.menu" = {
      bg = "base01";
      fg = "base05";
    };
    "ui.menu.scroll" = {
      bg = "base01";
      fg = "base03";
    };
    "ui.menu.selected" = {
      bg = "base04";
      fg = "base01";
    };
    "ui.popup" = {bg = "base01";};
    "ui.selection" = {bg = "base02";};
    "ui.selection.primary" = {bg = "base02";};
    "ui.statusline" = {
      bg = "base01";
      fg = "base04";
    };
    "ui.statusline.inactive" = {
      bg = "base01";
      fg = "base03";
    };
    "ui.statusline.insert" = {
      bg = "base0B";
      fg = "base00";
    };
    "ui.statusline.normal" = {
      bg = "base03";
      fg = "base00";
    };
    "ui.statusline.select" = {
      bg = "base0F";
      fg = "base00";
    };
    "ui.text" = "base05";
    "ui.text.focus" = "base05";
    "ui.virtual.indent-guide" = {fg = "base03";};
    "ui.virtual.inlay-hint" = {fg = "base03";};
    "ui.virtual.jump-label" = {
      fg = "base0A";
      modifiers = ["bold"];
    };
    "ui.virtual.ruler" = {bg = "base01";};
    "ui.window" = {bg = "base01";};
    variable = "base08";
    "variable.other.member" = "base0B";
    warning = "base09";

    palette = with config.colorScheme.palette; {
      base00 = "#${base00}";
      base01 = "#${base01}";
      base02 = "#${base02}";
      base03 = "#${base03}";
      base04 = "#${base04}";
      base05 = "#${base05}";
      base06 = "#${base06}";
      base07 = "#${base07}";
      base08 = "#${base08}";
      base09 = "#${base09}";
      base0A = "#${base0A}";
      base0B = "#${base0B}";
      base0C = "#${base0C}";
      base0D = "#${base0D}";
      base0E = "#${base0E}";
      base0F = "#${base0F}";
    };
  };
}
