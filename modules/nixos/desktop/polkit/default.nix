{pkgs, ...}: {
  security.polkit.enable = true;

  systemd.user.services.polkit-kde-authentication-agent-1 = {
    wantedBy = ["graphical-session.target"];
    script = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
  };
}
