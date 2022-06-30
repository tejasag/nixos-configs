{
  self,
  ...
} @ inputs: let
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  "bashly" = pkgs.callPackage ./bashly {};
  "h" = pkgs.callPackage ./hydrogen { name = "h"; };
}
