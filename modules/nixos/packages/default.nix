{pkgs, ...}: {
  imports = [
    ./fonts
    ./gtk.nix
  ];

  # system packages
  environment.systemPackages = with pkgs; [
    # cli tools
    curl
    wget
    killall
    tree
    fastfetch
    pfetch
    btop
    jq
    inotify-tools
    libnotify
    libsixel
    openssl
    unzip
    unrar
    p7zip
  ];
}
