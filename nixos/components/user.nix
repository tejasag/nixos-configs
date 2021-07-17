{ pkgs, ... }:

{
  users.users.tejasagarwal = {
	isNormalUser = true;
	extraGroups = [ "wheel" ];
	shell = pkgs.fish;
  };
}
