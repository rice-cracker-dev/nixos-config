{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [inputs.nvf-config.packages.${pkgs.system}.default];
}
