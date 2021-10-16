{ pkgs }:

pkgs.mkShell {
  name = "system-env";
  buildInputs = with pkgs; [
    rnix-lsp
  ];
}
