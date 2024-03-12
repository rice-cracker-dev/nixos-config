{pkgs, ...}: {
  home.packages = with pkgs; [
    # desktop utilities
    cinnamon.nemo-with-extensions

    # desktop apps
    bitwarden
    thunderbird
    vivaldi
    vivaldi-ffmpeg-codecs
    vesktop
    # anydesk # remote access
    sunshine

    # development tools
    vscode
    jetbrains.webstorm
    putty

    # compilers and runtimes
    nodejs
    node2nix
    nodePackages.pnpm
    bun
  ];
}
