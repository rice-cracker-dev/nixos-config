{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    packages.desktop.enable = lib.mkEnableOption "enable desktop packages";
  };

  config = lib.mkIf config.packages.desktop.enable {
    home.packages = with pkgs; [
      cinnamon.nemo-with-extensions
      ark
      gparted

      # desktop apps
      bitwarden # password manager
      thunderbird # mails
      floorp # browser
      vesktop # discord but better
      obs-studio # screen recording
      # sunshine # remote desktop
      inkscape # svg-based editor
      qbittorrent # torrents
      protonvpn-gui # vpn (doesnt work bruh)
      font-manager
      # gimp # yuck
      okular # pdf reader
      bless
      tigervnc
    ];
  };
}
