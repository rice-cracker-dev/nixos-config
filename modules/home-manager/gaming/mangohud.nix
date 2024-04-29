{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.gaming.enable {
    programs.mangohud = {
      enable = true;
      enableSessionWide = true;
    };
  };
}
