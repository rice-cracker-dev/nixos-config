{ config, ... }:

{
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver
  services.xserver.videoDrivers = [ "nvidia" ];

  # Nvidia settings
  hardware.nvidia = {
    # Modesettings
    modesetting.enable = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}

