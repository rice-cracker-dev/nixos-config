{pkgs, ...}: {
  security.polkit.enable = true;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    wantedBy = ["graphical-session.target"];
    script = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };
}
