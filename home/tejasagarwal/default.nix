{ self, master, ... }: { config, pkgs, ... }:

let
  mpkgs = import master {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };

  getPkgs = file: name: pkg:
    pkgs.lib.attrValues (pkgs.lib.getAttrs (builtins.fromJSON (builtins.readFile file)).${name} pkg);
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

  home.packages = getPkgs ./pkgs.json "pkgs" pkgs 
  ++ getPkgs ./pkgs.json "master" mpkgs 
  ++ getPkgs ./pkgs.json "self" self.packages.x86_64-linux
  ++ (with pkgs; [
    nodePackages.pnpm
    nodePackages.prettier
  ]);
}
