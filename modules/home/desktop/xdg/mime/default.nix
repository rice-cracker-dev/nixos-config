{
  xdg.mime = {
    enable = true;
  };

  xdg.mimeApps = let
    fileManager = "org.kde.dolphin.desktop";
    browser = "brave-browser.desktop";

    mimetypes = {
      # files
      "inode/directory" = fileManager;

      # jetbrains
      "x-scheme-handler/jetbrains" = "jetbrains-toolbox.desktop";

      # browser
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/chrome" = browser;
      "text/html" = browser;
      "application/x-extension-htm" = browser;
      "application/x-extension-html" = browser;
      "application/x-extension-shtml" = browser;
      "application/xhtml+xml" = browser;
      "application/x-extension-xhtml" = browser;
      "application/x-extension-xht" = browser;
    };
  in {
    enable = true;

    defaultApplications = mimetypes;
    associations.added = mimetypes;
  };
}
