{
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify.packages.${pkgs.system}.default;
in {
}
