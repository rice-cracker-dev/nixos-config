{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # desktop utilities
    dolphin

    # desktop apps
    kitty
    bitwarden
    thunderbird
    vivaldi vivaldi-ffmpeg-codecs
    vesktop
    # anydesk # remote access
    sunshine
  
    # development tools
    vscode
    jetbrains.webstorm
    putty
  
    # compilers and runtimes
    nodejs nodePackages.pnpm
  ];
}
