{
  description = "Project creation that rocks!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in rec {
    packages.ctp = pkgs.rustPlatform.buildRustPackage rec {
      pname = "ctp";
      version = "0.1.0";

      src = pkgs.fetchFromGitHub {
        owner = "tejasag";
        repo = "ctp";
        rev = "main";
        sha256 = "sha256-iFcd8vreT5Chrn5lG4Pkmnscw7OOx7Ki3oLnOgEQa74=";
      };

      cargoSha256 = "sha256-JXgHOASfNBLpMsyIJIo4r8a2yMXyKmMh7lalPrHKsiY=";

      meta = with pkgs.lib; {
        description = "Project creation that rocks!";
        license = licenses.mit;
        homepage = "https://github.com/tejasag/ctp";
      };
    };
    defaultPackage = packages.ctp;
  });
}
