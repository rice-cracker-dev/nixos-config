{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    polkit.enable = lib.mkEnableOption "enable polkit";
  };

  config = lib.mkIf config.polkit.enable {
    # enable pantheon polkit
    systemd.user.services.polkit-pantheon-authentication-agent-1 = {
      wantedBy = ["graphical-session.target"];
      script = "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit";
    };
  };
}
