{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # cli tools
    git gh
    curl wget
    fastfetch

    # desktop utilities
    dolphin

    # desktop apps
    kitty
    bitwarden
    thunderbird
    vivaldi vivaldi-ffmpeg-codecs
    vesktop
  ];
}
