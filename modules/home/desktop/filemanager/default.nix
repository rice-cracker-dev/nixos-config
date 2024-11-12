{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    fileManager = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enable filemanager";
      };
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.xfce.thunar.override {
          thunarPlugins = with pkgs.xfce; [
            thunar-volman
            thunar-archive-plugin
            thunar-media-tags-plugin
          ];
        };
      };
      mimetype = lib.mkOption {
        type = lib.types.str;
        default = "thunar";
      };
    };
  };

  config = let
    mimetypes = {
      "inode/directory" = config.fileManager.mimetype;
    };
  in
    lib.mkIf config.fileManager.enable {
      home.packages = [config.fileManager.package];

      xdg.mimeApps = {
        defaultApplications = mimetypes;
        associations.added = mimetypes;
      };
    };
}
