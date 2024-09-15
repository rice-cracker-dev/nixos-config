{inputs, pkgs, ...}: let
  agsPkgs = inputs.ags.packages.${pkgs.system};
in {
  programs.ags = {
    enable = true;
    configDir = ./config;

    extraPackages = [
      agsPkgs.network
      agsPkgs.wireplumber
      agsPkgs.bluetooth
      pkgs.pipewire pkgs.wireplumber
    ];
  };
}
