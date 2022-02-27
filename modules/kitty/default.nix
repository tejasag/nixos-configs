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
      
      # Gruvbox color scheme
        foreground = "#ebdbb2";
        background = "#272727";
        selection_foreground = "#655b53";
        selection_background = "#ebdbb2";
        url_color = "#d65c0d";

        # black
        color0 = "#272727";
        color8 = "#928373";

        # red
        color1 = "#cc231c";
        color9 = "#fb4833";

        # green
        color2 = "#989719";
        color10 = "#b8ba25";

        # yellow
        color3 = "#d79920";
        color11 = "#fabc2e";

        # blue
        color4 = "#448488";
        color12 = "#83a597";

        # magenta
        color5 = "#b16185";
        color13 = "#d3859a";

        # cyan
        color6 = "#689d69";
        color14 = "#8ec07b";

        # white
        color7 = "#a89983";
        color15 = "#ebdbb2";
    };

    keybindings = {
      "ctrl+shift+alt+l" = "next_tab";
      "ctrl+shift+alt+h" = "previous_tab";
      "F5": "launch --location=hsplit";
      "F6": "launch --location=vsplit";
      "F7": "layout_action rotate";
      "shift+up": "move_window up";
      "shift+left": "move_window left";
      "shift+right": "move_window right";
      "shift+down": "move_window down";
      "ctrl+left": "neighboring_window left";
      "ctrl+right": "neighboring_window right";
      "ctrl+up": "neighboring_window up";
      "ctrl+down": "neighboring_window down";
    };

    extraConfig = ''
    enabled_layouts tall:bias=65;full_size=1;mirrored=false, vertical, horizontal
    '';
  };
}
