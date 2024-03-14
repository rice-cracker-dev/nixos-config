{
  pkgs,
  inputs,
  ...
}: {
  # install hyprpicker
  home.packages = [
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
  ];
}
