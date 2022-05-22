final: prev: rec {
  bashly = prev.callPackage ./bashly { };
  
  h = (import ./hydrogen { pkgs = prev;  pname = "h"; });
}
