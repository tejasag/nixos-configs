#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     
{
  description = "NixOS system configuration for `delphin`";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    home-manager.url = "github:nix-community/home-manager/release-21.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: 
  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; }; 
      overlays = [(import ./overlays)];
    };

    lib = nixpkgs.lib; 

  in {

    homeManagerConfigurations = {
      tejasagarwal = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs; 
        username = "tejasagarwal";
        homeDirectory = "/home/tejasagarwal";
        stateVersion="21.05";
        configuration = {
          imports = [
            ./user/home.nix 
          ];
        };
      };
    };

    nixosConfigurations = {
      delphin = lib.nixosSystem {
        inherit system;         

        modules = [
           ./system/configuration.nix   
        ];
      };        
    };   
  };
}
