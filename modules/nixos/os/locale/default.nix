{
  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = let
    locale = "vi_VN";
  in {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";
}
