{ ... }:

{
  services.xserver.windowManager = {
    herbstluftwm = {
      enable = true;
      configFile = "/home/tejasagarwal/.dotfiles/config/herbstluftwm/autostart";
    };
  };
}
