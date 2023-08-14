{ pkgs, src, ... }:
pkgs.stdenv.mkDerivation rec {
  name = "private";
  version = "1.0";
  inherit src;

  installPhase = ''
    mkdir $out
    cp README.md $out
  '';
}
