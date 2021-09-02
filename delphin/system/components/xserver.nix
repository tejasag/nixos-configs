{ ... }:

{
  services.xserver = {
    enable = true;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    windowManager = {
	herbstluftwm = {
	  enable = true;
	  configFile = ../../.config/herbstluftwm/autostart;
	};
    };

    layout = "us";
    xkbOptions = "eurosign:e";

    libinput = {
	enable = true;
    };
  };
}
