
#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     
{ pkgs, ... }:

{
  users.users.tejasagarwal = {
	isNormalUser = true;
	extraGroups = [ "wheel" ];
	shell = pkgs.fish;
  };
}
