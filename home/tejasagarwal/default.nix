{ self, master, ... }: { config, pkgs, ... }:

let
  mpkgs = import master {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in
{
  programs.home-manager.enable = true;

  imports = [
    ../../modules/neovim.nix
    ../../modules/fish.nix
    ../../modules/git.nix
    ../../modules/kitty.nix
    ../../modules/starship.nix
    ../../modules/emacs.nix
    ../../modules/direnv.nix
    ../../modules/zoxide.nix
    ../../modules/vim.nix
  ];

  home.packages = self.lib.getPkgs "pkgs" pkgs 
  ++ self.lib.getPkgs "master" mpkgs 
  ++ self.lib.getPkgs "self" self.packages.x86_64-linux;
}
