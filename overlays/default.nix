final: prev: rec {
  # taken from https://github.com/alternateved/nixos-config/blob/main/overlays/default.nix
  haskellPackages = prev.haskellPackages.override (old: {
    overrides = prev.lib.composeExtensions (old.overrides or (_: _: { }))
      (self: super: rec {
        tejasag-xmonad = self.callCabal2nix "tejasag-xmonad"
          (prev.lib.sourceByRegex ../config/xmonad [
            "xmonad.hs"
            "tejasag-xmonad.cabal"
          ]) { };
        #tejasag-xmobar = self.callCabal2nix "tejasag-xmobar"
        #  (pkgs.lib.sourceByRegex ../config/xmobar [
        #    "xmobar.hs"
        #    "tejasag-xmobar.cabal"
        #  ]) { };
      });
  });

  bashly = prev.callPackage ./bashly { };
  
  h = ./hydrogen { pkgs = prev;  pname = "h"; };
}
