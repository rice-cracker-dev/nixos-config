{pkgs, ...}: {
  environment.systemPackages = [pkgs.piper];

  services.ratbagd.enable = true;
}
