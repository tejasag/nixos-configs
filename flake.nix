{
  description = "tejasag's nixos-configs";

  inputs = {
    master.url = "github:nixos/nixpkgs/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, master, home-manager, ... }@inputs:
    let
      inherit (nixpkgs.lib) nixosSystem;

      system = "x86_64-linux";
    in {
      lib = import ./lib inputs;

      homeConfigurations = import ./home inputs;

      packages.${system} = import ./packages inputs;
      defaultApp.${system} = self.packages.${system}.h;

      nixosConfigurations.delphin = nixosSystem {
        inherit system;
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ 
          ./hosts/delphin
          {
            nix = {
              registry.nixpkgs.flake = inputs.nixpkgs;
              nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
            };
          }
        ];
      };
    };
}
