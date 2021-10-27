{ pkgs, ... }:

{
  services.xserver = {
   # displayManager.defaultSession = "none+myxmonad";
    windowManager.session = [{
        name="myxmonad";
        start = ''
          /usr/bin/env tejasag-xmonad &
          waitPID=$!
        '';
    }];
  };

  environment.systemPackages = with pkgs; [
    xdotool
    xwallpaper
    xsecurelock
    xorg.xkill

    haskellPackages.xmonad
    haskellPackages.tejasag-xmonad
  ];
}
