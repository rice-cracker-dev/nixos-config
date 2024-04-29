{pkgs, ...}: {
  programs.neovim-flake.settings = {
    vim.extraPlugins = with pkgs.vimPlugins; {
      everforest = {
        package = everforest;
      };
    };

    vim.statusline.lualine.theme = "everforest";

    vim.luaConfigRC.theme = ''
      vim.cmd[[let g:everforest_background = 'hard']]
      vim.cmd[[let g:everforest_transparent_background = 1]]
      vim.cmd[[colorscheme everforest]]
    '';
  };
}
