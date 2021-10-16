#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     
{ ... }:

{
  services.xserver.windowManager = {
    herbstluftwm = {
      enable = true;
      configFile = ~/.dotfiles/config/herbstluftwm/autostart;
    };
  };
}


