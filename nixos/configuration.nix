# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./components/boot.nix
      ./components/networking.nix
      ./components/sound.nix
      ./components/user.nix
      ./components/internationlisation.nix
      ./components/printing.nix
      ./components/time.nix
      ./components/xserver.nix
   #   ./components/android-studio.nix
    ];

  environment.systemPackages = with pkgs; [
    brave

    (pkgs.writeShellScriptBin "nixFlakes" ''
      exec ${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"
    '')
  ];
 
  nix.extraOptions = ''
	keep-outputs = true
	keep-derivations = true
  '';

  system.stateVersion = "21.05"; 
}
