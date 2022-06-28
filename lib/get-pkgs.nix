{
  self,
  nixpkgs,
  ...
} @ inputs: name: pkg:
let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
in
  builtins.map (x: pkgs.lib.getAttrFromPath (pkgs.lib.splitString "." x) pkg) (builtins.fromJSON(builtins.readFile ./pkgs.json)).${name};

