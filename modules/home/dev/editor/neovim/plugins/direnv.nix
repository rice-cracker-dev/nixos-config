{pkgs, ...}: let
  inherit (pkgs.vimPlugins) direnv-vim;
in {
  programs.neovim-flake.settings.vim.extraPlugins.direnv = {package = direnv-vim;};
}
