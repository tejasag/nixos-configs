{
  description = "tejasag's nixos-configs";

  inputs = {
    master.url = "github:nixos/nixpkgs/master";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ========= overlays ========= #
    hackclub.url = "github:hackclub/nix-overlay";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, master, home-manager, nur, hackclub, ... }@inputs:
    let
      inherit (home-manager.lib) homeManagerConfiguration;
      inherit (nixpkgs.lib) nixosSystem;

      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        
        overlays = [
          hackclub.overlay.${system}
          nur.overlay
          (import ./overlays)
        ];
      };

    in {
      lib = import ./lib inputs;

      devShell.${system} = import ./shell.nix { inherit pkgs; };

      homeConfigurations = import ./home inputs;

      nixosConfigurations.delphin = nixosSystem {
        inherit system pkgs;
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
