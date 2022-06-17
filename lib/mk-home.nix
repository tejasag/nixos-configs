{
  self,
  home-manager,
  master,
  ...
} @ inputs: username: system: nixpkgs: 

let
  entrypoint = import "${self}/home/${username}.nix" inputs;
in
  home-manager.lib.homeManagerConfiguration {
    inherit username system;
    homeDirectory = "/home/${username}";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

#    extraSpecialArgs.master = master.legacyPackages.${system};
    configuration.imports = [ entrypoint ];
  }
 

