{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    packages.dev.enable = lib.mkEnableOption "enable dev packages";
  };

  config = lib.mkIf config.packages.dev.enable {
    home.packages = with pkgs; [
      # javascript and runtimes
      nodejs
      node2nix
      nodePackages.pnpm
      nodePackages.yarn
      nodePackages.wrangler
      nodePackages.eslint
      nodePackages.prettier
      bun

      # python
      python3
    ];
  };
}
