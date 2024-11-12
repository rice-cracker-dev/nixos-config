{
  xdg.mime = {
    enable = true;
  };

  xdg.mimeApps = let
    mimetypes = {
      # jetbrains
      "x-scheme-handler/jetbrains" = "jetbrains-toolbox.desktop";
    };
  in {
    enable = true;

    defaultApplications = mimetypes;
    associations.added = mimetypes;
  };
}
