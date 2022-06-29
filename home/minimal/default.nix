{ self, ... }: { config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ../../modules/git.nix
    ../../modules/direnv.nix
    ../../modules/vim.nix
  ];

  home.packages = self.lib.getPkgs "pkgs" pkgs ./pkgs.json;
}
