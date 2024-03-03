{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # cli tools
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
  
    # development tools
    vscode
    jetbrains.webstorm
  
    # compilers and runtimes
    nodejs
  ];
}
