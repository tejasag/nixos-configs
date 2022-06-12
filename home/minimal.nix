{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "tejasagarwal";
  home.homeDirectory = "/home/tejasagarwal";

  imports = [
    ../modules/git.nix
    ../modules/direnv.nix
    ../modules/vim.nix
  ];

  home.packages = with pkgs; [
    h

    htop            
    wget            
  ];
}
