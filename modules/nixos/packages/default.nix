{ pkgs, ... }:

{
  imports = [
    ./fonts.nix
  ];

  # system packages
  environment.systemPackages = with pkgs; [
    # cli tools
    curl wget
    killall
    tree
    fastfetch
  ];
}

