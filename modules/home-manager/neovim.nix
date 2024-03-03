{ config, pkgs, ... }:

{
  programs.nixvim = {
    # enable nixvim
    enable = true;

    # bugged???
    # set nixvim colorschemes
    # colorschemes.gruvbox = {
    #   enable = true;
    # };

    # extraPlugins = [
    #   {
    #     plugin = pkgs.vimPlugins.catppuccin-nvim;
    #     config = "colorscheme catppuccin";
    #   }
    # ];

    # set nixvim options
    options = {
      # show line number
      number = true;

      # set tab width
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      # set auto-indent
      autoindent = true;
    };

    plugins = {
      chadtree.enable = true;
    };
  };
}

