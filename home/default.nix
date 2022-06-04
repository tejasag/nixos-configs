{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "tejasagarwal";
  home.homeDirectory = "/home/tejasagarwal";

  imports = [
#    ../modules/neovim.nix
    ../modules/fish.nix
    ../modules/git.nix
    ../modules/kitty.nix
    ../modules/starship.nix
#    ../modules/emacs.nix
    ../modules/direnv.nix
    ../modules/zoxide.nix
    ../modules/vim.nix
  ];

  home.packages = with pkgs; [
    h               # hydrogen.

    # Util 
    git             # version control system
    wirelesstools   # Wireless CLI utilities
    flameshot       # screenshot utility
    gnutls          # GNU transport layer security lib
    neofetch        # CLI to show system information
    htop            # System monitor
    fish            # <shell><
    killall         # *cough* killall $PERSON_READING *cough*
    ripgrep         # Recursive file searcher
    gnome.gnome-bluetooth # bluetooth manager for gnome
    pavucontrol     # audio controller
    bat             # cat replacement 
    niv             # nix dep manager
    wget            # HTTP retriever
    blueman         # bluetooth manager
    ranger          # Terminal file manager
    conky           # System monitor

    # Misc
    ngrok           # proxy tunnel
    firefox         # browser
    brave           # browser
    slack           # slack chat app
    zoom-us         # Instant meeting app
    spotify         # Music Player
    blender         # 3D Editing software
    gnome.cheese    # Camera app
    insomnia        # REST Client
    discord         # Chat app
    minecraft       # Minecraft. yes.
    obs-studio      # Recording software
    arduino         # arduino.
    vlc             # media player
    imagemagick     # bitmap images editor
    virtualbox      # pc emulator
    bashly          # bashly
    vscode          # Text Editor
    thunderbird     # Email client

    # Display
    nitrogen        # wallpaper dameon
    polybar         # bar 
    picom           # compositor
    rofi            # application launcher
    dunst           # notifcation daemon
    eww             # widget daemon
  ];
}
