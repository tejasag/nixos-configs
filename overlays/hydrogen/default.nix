{
  pkgs,
  pname ? "hydrogen",
}:

pkgs.writeShellScriptBin {
  name = pname;
  text = ''
  ./h
  '';
}
