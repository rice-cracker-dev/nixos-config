{inputs, ...}: {
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

  gtk = {
    enable = true;
  };
}
