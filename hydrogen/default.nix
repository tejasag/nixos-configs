{
  pkgs,
  pname ? "hydrogen",
}:

pkgs.writeShellScriptBin pname ''
  ~/.dotfiles/hydrogen/h
''
