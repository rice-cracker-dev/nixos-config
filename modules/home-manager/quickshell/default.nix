{
  pkgs,
  inputs,
  config,
  ...
}: {
  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
  ];

  home.file."${config.home.homeDirectory}/.config/quickshell" = {
    source = ./config;
    recursive = true;
  };
}
