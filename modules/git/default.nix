#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#      
{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Tejas Agarwal";
    userEmail = "tejasagarwalbly@gmail.com";
    extraConfig = {
      init = {
       defaultBranch = "main";
      };
    };
  };
}
