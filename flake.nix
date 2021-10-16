#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     
{
  description = "tejasag's nixos-configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-21.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hackclub.url = "github:hackclub/nix-overlay";
  };

  outputs = { nixpkgs, home-manager, unstable, hackclub, ... }: 
  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; }; # sorry Stallman onii-san
      overlays = [ hackclub.overlay ];
    };

    lib = nixpkgs.lib; 
  in 
  {
    homeManagerConfigurations = {
      tejasagarwal = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs; 

        username = "tejasagarwal";
        homeDirectory = "/home/tejasagarwal";
        stateVersion="21.05";
        configuration = {
          imports = [ ./home ];
        };
      };
    };

    nixosConfigurations = {
      delphin = lib.nixosSystem {
        inherit system;         

        modules = [ ./hosts/delphin/configuration.nix ];
      };        
    };   
  };
}
