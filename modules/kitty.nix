{ ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "Victor Mono Semibold Nerd Font Complete";
      size = 12;
    };

    settings = {
      shell = "fish";
      tab_bar_style = "powerline";
      confirm_os_window_close = 0;

      window_padding_width = 5;
      
      foreground = "#CAD3F5";
      background = "#24273A";
      selection_foreground = "#24273A";
      selection_background = "#F4DBD6";

      url_color = "#F4DBD6";

      cursor_text_color = "#24273A";
      cursor = "#F4DBD6";

      active_border_color = "#B7BDF8";
      inactive_border_color = "#6E738D";
      bell_border_color = "#EED49F";

      active_tab_foreground = "#181926";
      active_tab_background = "#C6A0F6";
      inactive_tab_foreground = "#CAD3F5";
      inactive_tab_background = "#1E2030";
      tab_bar_background = "#181926";

      mark1_foreground = "#24273A";
      mark1_background = "#B7BDF8";
      mark2_foreground = "#24273A";
      mark2_background = "#C6A0F6";
      mark3_foreground = "#24273A";
      mark3_background = "#7DC4E4";

      # black
      color0 = "#494D64";
      color8 = "#5B6078";

      # red
      color1 = "#ED8796";
      color9 = "#ED8796";

      # green
      color2 = "#A6DA95";
      color10 = "#A6DA95";

      # yellow
      color3 = "#EED49F";
      color11 = "#EED49F";

      # blue
      color4 = "#8AADF4";
      color12 = "#8AADF4";

      # magenta
      color5 = "#F5BDE6";
      color13 = "#F5BDE6";

      # cyan
      color6 = "#8BD5CA";
      color14 = "#8BD5CA";

      # white
      color7 = "#B8C0E0";
      color15 = "#A5ADCB";
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
