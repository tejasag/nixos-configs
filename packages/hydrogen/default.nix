{
  pkgs,
  stdenv,

  name ? "hydrogen",
}:

stdenv.mkDerivation {
  inherit name;
  src = ../../bin/h.lua;
  buildInputs = with pkgs; [ lua5_4 ];
  phases = "installPhase";
  installPhase = ''
    mkdir -p $out $out/bin
    cp -fv $src $out/bin/${name}
  '';
}

