{
  config,
  lib,
  ...
}: {
  options = {
    ssh.enable = lib.mkEnableOption "enable ssh";
  };

  config = lib.mkIf config.ssh.enable {
    # enable the ssh daemon.
    services.openssh.enable = true;
  };
}
