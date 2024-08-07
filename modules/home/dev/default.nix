{pkgs, ...}: {
  imports = [
    ./direnv
    ./editor
    ./git
    ./ide
    ./shell
  ];

  # install additional development packages
  home.packages = with pkgs; [
    curl
    wget
    inotify-tools
    btop
    tree
  ];
}
