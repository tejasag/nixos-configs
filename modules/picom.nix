{ ... }:

{
  services.picom = {
    enable = true;
    shadow = true;
    shadowOffsets = [ (-27) (-27) ];
    shadowOpacity = "0.3";
    # fade = true;
    # fadeDelta = 3;
    extraOptions = ''
corner-radius = 8;

rounded-corners-exclude = [
    "name               *= 'dmenu'",
    "class_g             = 'Conky'",
    "class_g             = 'Polybar'",
    "class_i             = 'tray'",
    "window_type         = 'desktop'",
    "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'",
    "_GTK_FRAME_EXTENTS@:c"
];
    '';
  };
}
