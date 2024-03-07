{ ... }:

{
  programs.nixvim.keymaps = [
    { action = "<cmd>CHADopen<CR>"; key = "<C-n>"; }
    { action = "<cmd>ToggleTerm<CR>"; key = "<C-`>"; }
  ];
}

