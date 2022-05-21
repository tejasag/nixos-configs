#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#      
{ ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "Iosevka Nerd Font";
      size = 13;
    };

    settings = {
      shell = "fish";
     # cursor_shape = "beam";
      tab_bar_style = "powerline";
      background_opacity = "0.95";

      active_border_color = "#BD93F9";
      window_padding_width = 5;
      
      foreground = "#D8DEE9";
      background = "#2E3440";
      selection_foreground = "#000000";
      selection_background  = "#FFFACD";
      url_color             ="#0087BD";
      cursor                ="#81A1C1";

      # black
      color0   ="#3B4252";
      color8   ="#4C566A";

      # red
      color1   ="#BF616A";
      color9  =" #BF616A";

      # green
      color2  ="#A3BE8C";
      color10  ="#A3BE8C";

      # yellow
      color3   ="#EBCB8B";
      color11  ="#EBCB8B";

      # blue
      color4  ="#81A1C1";
      color12 ="#81A1C1";

      # magenta
      color5  ="#B48EAD";
      color13 ="#B48EAD";

      # cyan
      color6  ="#88C0D0";
      color14 ="#8FBCBB";

      # white
      color7  ="#E5E9F0";
      color15  ="#ECEFF4";
    };

    keybindings = {
      "ctrl+shift+alt+l" = "next_tab";
      "ctrl+shift+alt+h" = "previous_tab";
      "shift+k"= "move_window up";
      "shift+h"= "move_window left";
      "shift+l"= "move_window right";
      "shift+j"= "move_window down";
      "ctrl+h"= "neighboring_window left";
      "ctrl+l"= "neighboring_window right";
      "ctrl+k"= "neighboring_window up";
      "ctrl+j"= "neighboring_window down";
    };

    extraConfig = ''
    enabled_layouts tall:bias=65;full_size=1;mirrored=false, vertical, horizontal
    '';
  };
}
