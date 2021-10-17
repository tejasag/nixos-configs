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
    home-manager = {
      url = "github:nix-community/home-manager/release-21.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ========= overlays ========= #
    hackclub.url = "github:hackclub/nix-overlay";
    nur.url = "github:nix-community/NUR";
    xmobar.url = "github:tejasag/xmobar";
    xmonad.url = "github:xmonad/xmonad";
    xmonad-contrib.url = "github:xmonad/xmonad-contrib";
  };

  outputs = { nixpkgs, home-manager, hackclub, nur, xmobar, xmonad, xmonad-contrib, ... }: 
  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; }; # sorry Stallman onii-san
      overlays = [ 
        hackclub.overlay
        nur.overlay
        xmobar.overlay
        xmonad.overlay
        xmonad-contrib.overlay
        (import ./overlays)
      ];
    };

    lib = nixpkgs.lib; 
  in 
  {
    devShell.${system} = import ./shell.nix { inherit pkgs; };

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

      minimal = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        username = "tejasagarwal";
        homeDirectory = "/home/tejasagarwal";
        stateVersion = "21.05";
        configuration = {
          imports = [ ./home/minimal.nix ];
        };
      };
    };

    nixosConfigurations = {
      delphin = lib.nixosSystem {
        inherit system;         
        modules = [ ./hosts/delphin ];
      };        
    };   
  };
}
