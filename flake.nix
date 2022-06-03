{
  description = "tejasag's nixos-configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ========= overlays ========= #
    hackclub.url = "github:hackclub/nix-overlay";
    nur.url = "github:nix-community/NUR";
  };

  outputs = inputs@{nixpkgs, home-manager, nur, hackclub, ... }:
    let
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

      lib = nixpkgs.lib;
    in {
      devShell.${system} = import ./shell.nix { inherit pkgs; };

      homeManagerConfigurations = {
        tejasagarwal = home-manager.lib.homeManagerConfiguration {
          inherit system pkgs;
          username = "tejasagarwal";
          homeDirectory = "/home/tejasagarwal";
          stateVersion = "21.05";
          configuration.imports = [ ./home ];
        };

        minimal = home-manager.lib.homeManagerConfiguration {
         inherit system pkgs;
          username = "tejasagarwal";
          homeDirectory = "/home/tejasagarwal";
          stateVersion = "21.05";
          configuration.imports = [ ./home/minimal.nix ]; 
        };
      };

      nixosConfigurations = {
        delphin = lib.nixosSystem {
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
    };
}
