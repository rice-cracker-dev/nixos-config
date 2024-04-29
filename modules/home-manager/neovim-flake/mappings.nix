_: {
  programs.neovim-flake.settings.vim.maps = {
    normal = {
      "<C-n>".action = "<cmd>NvimTreeToggle<CR>";
    };

    terminal = {
      "<esc>".action = "<cmd>q<CR>";
    };
  };
}
