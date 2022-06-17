{ self, ...} @ inputs: {
  tejasagarwal = self.lib.mkHome "tejasagarwal" "x86_64-linux" inputs.nixpkgs;
  minimal = self.lib.mkHome "minimal" "x86_64-linux" inputs.nixpkgs;
}
