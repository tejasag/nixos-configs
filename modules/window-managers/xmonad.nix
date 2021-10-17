{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     haskellPackages.xmonad
     haskellPackages.tejasag-xmonad
  ];
}
