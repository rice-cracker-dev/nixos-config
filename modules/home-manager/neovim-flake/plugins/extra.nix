{pkgs, ...}: let
  inherit (pkgs.vimPlugins) direnv-vim;
in {
  config = {
    programs.neovim-flake.settings.vim.extraPlugins = {
      direnv = {package = direnv-vim;};
    };
  };
}
