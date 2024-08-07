{pkgs, ...}: {
  imports = [
    ./direnv.nix
  ];

  programs.neovim-flake.settings.vim.languages.bash.lsp.package = pkgs.bash-language-server;
}
