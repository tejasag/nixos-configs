#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#   
{ ... }:

{
  home-manager.users.tejasagarwal.programs.starship = {
    enable = true;

    settings = {
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
      };
      # line_break = {
      #  disabled = true;
      # }; 
    };
  };
}
