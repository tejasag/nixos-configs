{ pkgs }:

pkgs.mkShell {
  name = "system-env";
  buildInputs = with pkgs; [
    rnix-lsp

    # haskell tools
    cabal-install
    ghcid
    haskellPackages.ormolu
  ];
}
