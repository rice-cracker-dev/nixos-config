{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = [pkgs.bun];
}
