#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     
{ ... }:

{
  services.openssh = {
    enable = true;
  };

  networking = {
    hostName = "delphin";
    useDHCP = false;
    interfaces = {
      eno1.useDHCP = true;
      wlp2s0.useDHCP = true;
    };
  };
}
