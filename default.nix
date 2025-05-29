{
  lib,
  stdenvNoCC,
  pkgs,
}:

stdenvNoCC.mkDerivation rec {
  pname = "eorzean-typeface";
  version = "1.051";

  src = pkgs.fetchurl {
    url = "https://github.com/karaipsum/Eorzean-Typeface/releases/download/v${version}/AugmentedNeo-Eorzean-Regular.otf";
    hash = "sha256-SeIJ6uQjCeV0IwJoSt557nIHBk1l6J+N7ef7LzS2ugs=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -Dm644 $src -t $out/share/fonts/opentype
    runHook postInstall
  '';

  meta = {
    description = "Augmented Neo-Eorzean";
    homepage = "https://github.com/karaipsum/Eorzean-Typeface";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}
