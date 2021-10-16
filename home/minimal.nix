#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     

{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "tejasagarwal";
  home.homeDirectory = "/home/tejasagarwal";

  imports = [
    ./programs/git.nix
    ./programs/direnv.nix
  ];

  home.packages = with pkgs; [

    # Util 
    git             # version control system
    htop            # System monitor
    wget            # HTTP retriever

    # Editors & more
    vim             # terminal editor
  ];
}
