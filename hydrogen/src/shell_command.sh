pkgs=''
eval "pkgs=(${args[packages]})"
final=''

[ -f shell.nix ] && error "shell.nix already exists." && exit 1

for i in "${pkgs[@]}"; do
  final+=" "
  final+=$i
done

echo " { pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ $final ];
}" >> shell.nix

echo "use nix" >> .envrc

direnv allow

success "Done! Added the following packages:\n$final"


