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
    ../../modules/picom.nix
  ];

  home.packages = self.lib.getPkgs "pkgs" pkgs ./pkgs.json
  ++ self.lib.getPkgs "master" mpkgs ./pkgs.json
  ++ self.lib.getPkgs "self" self.packages.x86_64-linux ./pkgs.json;
}
