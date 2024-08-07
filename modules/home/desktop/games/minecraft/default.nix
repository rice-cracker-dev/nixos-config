{pkgs, ...}: {
  home.packages = with pkgs; [
    lunar-client
    (prismlauncher.override {
      jdks = [jdk17 jdk21];
    })
  ];
}
