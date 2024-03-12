{ lib, ... }:

{
  options = {
    assetsDirectory = lib.mkOption {
      type = lib.types.path;
      description = ''
        Path to your assets directory
      '';
    };
  }; 
}
