{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  name = "segoe-ui";

  src = pkgs.fetchurl {
    url = "https://aka.ms/SegoeFonts";
    sha256 = "1j6d9ad0i06a84vz09lp70d0cjmh8x24wh5vrqww34nmvlpaigcw";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    ${pkgs.unzip}/bin/unzip $src
    cp segoeui.ttf $out/share/fonts/truetype
  '';
}
