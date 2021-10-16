
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
    hashedPassword = "954fff6b071334447f88690c756ec9f964ca207f96f803de500568b8054916d4";
	extraGroups = [ "wheel" ];
	shell = pkgs.fish;
  };
}
