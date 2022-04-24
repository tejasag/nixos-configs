inspect_args
pkgs=''
eval "pkgs=(${args[packages]})"
echo ${pkgs}

echo " { pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ ${pkgs} ];
}" >> shell.nix

echo "use nix" >> .envrc

direnv allow


