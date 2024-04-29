{pkgs, ...}: {
  fonts.packages = with pkgs; [
    # main font
    noto-fonts

    # fonts
    jetbrains-mono

    # nerd font
    (nerdfonts.override {
      fonts = [
        "NerdFontsSymbolsOnly"
        "JetBrainsMono"
      ];
    })
  ];
}
