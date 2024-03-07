{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.nixosModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    # enable nixvim
    enable = true;

    # set nixvim colorschemes
    colorschemes.catppuccin = {
      enable = true;
      flavour = "macchiato";
    }; 
  };
}

