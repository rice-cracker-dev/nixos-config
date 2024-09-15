{inputs, ...}: {
  imports = [
    ./cursor.nix
    ./gtk.nix
    ./qt.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
