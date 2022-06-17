{
  self,
  home-manager,
  ...
} @ inputs: username: system: nixpkgs: 

let
  entrypoint = import "${self}/home/${username}.nix" inputs;
in
  home-manager.lib.homeManagerConfigurations {
    inherit username system;
    homeDirectory = "/home/${username}";
    pkgs = nixpkgs.legacyPackages.${system};
    configuration.imports = [ entrypoint ];
  }
 

