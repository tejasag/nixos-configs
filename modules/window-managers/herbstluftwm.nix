{ ... }:

{
  services.xserver.windowManager = {
    awesome.enable = true;
    herbstluftwm = {
      enable = true;
      configFile = "/home/tejasagarwal/.dotfiles/config/herbstluftwm/autostart";
    };
  };
}
