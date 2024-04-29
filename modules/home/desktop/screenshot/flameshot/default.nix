{config, ...}: let
  screenshotDir = "${config.home.homeDirectory}/Pictures/Screenshots";
in {
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        savePath = screenshotDir;
        saveAfterCopy = true;
      };
    };
  };
}
