{ config, pkgs }:

{
  programs.home-manager.enable = true;

  imports = [
    ../modules/git.nix
    ../modules/fish.nix
    ../modules/vim.nix
    ../modules/starship.nix
    ../modules/direnv.nix
  ];

  home.packages = with pkgs; [
    h
    htop
    wget
    natls
    neofetch
    ranger
  ];
}
