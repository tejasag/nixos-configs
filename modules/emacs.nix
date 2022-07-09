{ pkgs, ... }:

{
  services.emacs = {
    enable = true;
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [ vterm ];
  };
 }
