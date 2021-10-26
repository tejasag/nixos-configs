{
  pkgs,
  bundlerApp,

  pname ? "bashly"
}

bundlerApp {
  inherit pname;
  gemdir = ./.;
  exes = [ "bashly" ];
};
