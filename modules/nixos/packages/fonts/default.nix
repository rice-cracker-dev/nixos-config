{
  pkgs,
  config,
  lib,
  ...
}: let
  segoe = {
    mdl2 = import ./segoe-mdl2.nix {inherit pkgs;};
    ui = import ./segoe-ui.nix {inherit pkgs;};
  };
in {
  options = {
    packages.fonts.enable = lib.mkEnableOption "enable font packages";
  };

  config = lib.mkIf config.packages.fonts.enable {
    # enable fonts
    fonts.fontconfig.enable = true;

    # packages
    fonts.packages = [
      # fonts
      pkgs.jetbrains-mono

      # nerd font
      (pkgs.nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
          "JetBrainsMono"
        ];
      })

      segoe.mdl2
      segoe.ui
    ];
  };
}
