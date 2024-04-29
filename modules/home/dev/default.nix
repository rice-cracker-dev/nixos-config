{pkgs, ...}: {
  imports = [
    ./direnv
    ./editor
    ./git
    ./shell
  ];

  # install additional development packages
  home.packages = with pkgs; [
    curl
    wget
    inotify-tools
    btop
  ];
}
