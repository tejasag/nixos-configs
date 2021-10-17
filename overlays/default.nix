# taken from https://github.com/alternateved/nixos-config/blob/main/overlays/default.nix
_: pkgs: rec {
  haskellPackages = pkgs.haskellPackages.override (old: {
    overrides = pkgs.lib.composeExtensions (old.overrides or (_: _: { }))
      (self: super: rec {
        tejasag-xmonad = self.callCabal2nix "tejasag-xmonad"
          (pkgs.lib.sourceByRegex ../config/xmonad [
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
}
