{pkgs, ...}: {
  # install pantheon polkit
  # environment.systemPackages = with pkgs; [
  #   pantheon.pantheon-agent-polkit
  # ];

  # enable pantheon polkit
  systemd.user.services.polkit-pantheon-authentication-agent-1 = {
    wantedBy = ["graphical-session.target"];
    script = "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit";
  };
}
