{
  pkgs,
  pname ? "hydrogen",
}:

pkgs.writeShellScriptBin pname ''
  ./h
''
