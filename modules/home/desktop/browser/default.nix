{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    browser = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enable browser";
      };
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.brave;
      };
      mimetype = lib.mkOption {
        type = lib.types.str;
        default = "brave-browser";
      };
    };
  };

  config = let
    mimetypes = {
      "x-scheme-handler/http" = config.browser.mimetype;
      "x-scheme-handler/https" = config.browser.mimetype;
      "x-scheme-handler/chrome" = config.browser.mimetype;
      "text/html" = config.browser.mimetype;
      "application/x-extension-htm" = config.browser.mimetype;
      "application/x-extension-html" = config.browser.mimetype;
      "application/x-extension-shtml" = config.browser.mimetype;
      "application/xhtml+xml" = config.browser.mimetype;
      "application/x-extension-xhtml" = config.browser.mimetype;
      "application/x-extension-xht" = config.browser.mimetype;
    };
  in
    lib.mkIf config.browser.enable {
      home.packages = [config.browser.package];

      xdg.mimeApps = {
        defaultApplications = mimetypes;
        associations.added = mimetypes;
      };
    };
}
