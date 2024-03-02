{ pkgs, ... }:

{
  # Enable ZSH shell
  programs.zsh.enable = true;

  # Set ZSH shell as the default shell to all users
  users.defautUserShell = pkgs.zsh;
}

