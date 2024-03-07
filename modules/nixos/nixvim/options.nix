{ pkgs, ... }:

{
  # set nixvim options
  programs.nixvim.options = {
    # show line number
    number = true;

    # set tab width
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;

    # set auto-indent
    autoindent = true;

    # set default shell
    shell = "${pkgs.zsh}/bin/zsh";
  }; 
}

