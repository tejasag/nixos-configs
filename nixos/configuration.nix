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
    vim     
    wget
    firefox
    git
    brave
    glibc
    androidSdk
  ];


  system.stateVersion = "21.05"; 

}

