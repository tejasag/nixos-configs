{
  self,
  home-manager,
  master,
  ...
} @ inputs: username: system: nixpkgs: 

let
  entrypoint = import "${self}/home/${username}" inputs;
  homeDirectory = "/home/${username}";
in
  home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    modules = [
      entrypoint
      {
        home = {
          inherit username homeDirectory;
          stateVersion = "22.11";
        };
      }
    ];
  }
 

