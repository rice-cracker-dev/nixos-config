{pkgs, ...}: {
  home.packages = with pkgs; [
    # desktop utilities
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xarchiver
    gparted

    # desktop apps
    bitwarden
    thunderbird
    floorp
    vesktop
    obs-studio
    sunshine
    inkscape
    qbittorrent
    protonvpn-gui
    font-manager
    gimp # eww
    bless
    tigervnc

    # development tools
    vscode
    jetbrains-toolbox
    putty
    # redisinsight

    # compilers and runtimes
    nodejs
    node2nix
    nodePackages.pnpm
    nodePackages.yarn
    nodePackages.wrangler
    nodePackages.eslint
    nodePackages.prettier
    bun
  ];
}
