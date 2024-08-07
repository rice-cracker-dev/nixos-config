{
  config,
  pkgs,
  ...
}: {
  nix.settings = {
    extra-substituters = ["https://cuda-maintainers.cachix.org"];
    extra-trusted-public-keys = ["cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="];
  };

  # Libva driver
  environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";}; # Force intel-media-driver
  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
  };

  # Install some packages
  environment.systemPackages = with pkgs; [
    lshw
  ];

  # Enable CUDA
  # nixpkgs.config.cudaSupport = true;

  # Enable OpenGL
  hardware.opengl = {
    enable = true;

    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Load nvidia driver
  services.xserver.videoDrivers = ["nvidia"];

  # Nvidia settings
  hardware.nvidia = {
    modesetting.enable = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.production;

    open = false;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
