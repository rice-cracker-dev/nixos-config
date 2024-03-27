{config, ...}: let
  homeDir = config.home.homeDirectory;
  fastfetchDir = "${homeDir}/.config/fastfetch";
  logoPath = "${fastfetchDir}/logo.sixel";
in {
  home.file.${logoPath}.source = ./logo.sixel;
}
