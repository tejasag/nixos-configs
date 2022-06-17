{
  pkgs,
  writeShellScriptBin,

  pname ? "hydrogen",
}:

writeShellScriptBin pname ''
  ~/.dotfiles/hydrogen/h $@
''
