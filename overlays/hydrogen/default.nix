{
  lib,
  writeShellScriptBin,
  
  pname ? "hydrogen",
}:

writeShellScriptBin {
  name = pname;
  text = ''
  ./h
  '';
}
