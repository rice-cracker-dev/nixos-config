{
  pkgs,
  config,
  ...
}: let
  homeDir = config.home.homeDirectory;
  sattyConfigPath = "${homeDir}/.config/satty/config.toml";
  sattyFileName = "${config.screenshotsDir}/satty-%H-%M-%S_%d-%m-%Y.png";
in {
  home.packages = with pkgs; [
    grim
    slurp
    grimblast
    satty
  ];

  # satty config
  home.file.${sattyConfigPath}.text = ''
    [general]
    fullscreen = true
    early-exit = true
    initial-tool = "brush"
    copy-command = "wl-copy"
    annotation-size-factor = 2
    output-filename = "${sattyFileName}"
    save-after-copy = true
    default-hide-toolbars = false
  '';
}
