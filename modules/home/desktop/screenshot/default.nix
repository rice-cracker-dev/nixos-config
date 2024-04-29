{
  lib,
  config,
  ...
}: {
  imports = [./grimblast];

  options.screenshotsDir = lib.mkOption {
    type = lib.types.str;
    description = "where screenshots are saved";
    default = "${config.home.homeDirectory}/Pictures/Screenshots";
  };
}
