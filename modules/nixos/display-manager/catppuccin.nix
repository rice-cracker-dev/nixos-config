{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "f3db13cbe8e99a4ee7379a4e766bc8a4c2c6c3dd";
    sha256 = "0yfrkx2j5sysb0baf1kv83bgqknabcjc9dwqkghashk364whjfnk";
  };

  installPhase = ''
    mkdir -p $out
    cp -r ./src/catppuccin-macchaito/* $out/
  '';
}

