#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     

{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "tejasagarwal";
  home.homeDirectory = "/home/tejasagarwal";

  imports = [
    ../modules/neovim
    ../modules/fish
    ../modules/git
    ../modules/kitty
    ../modules/starship
    ../modules/emacs
    ../modules/direnv
    ../modules/zoxide
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
    coreutils       # basic GNU utilities
    fd              # Faster `find` alternative
    cmake           # Makefile generator
    libtool         # a generic library support script
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
    clang           # I am C-peed xD 
    clang-tools     # tools.
    minecraft       # Minecraft. yes.
    obs-studio      # Recording software
    arduino         # arduino.
    libvterm        # terminal emulator
    vlc             # media player
    imagemagick     # bitmap images editor
    jdk             # java development kit ._.
    virtualbox      # pc emulator
    protonvpn-gui   # vpn
    bashly          # bashly

    # Display
    nitrogen        # wallpaper dameon
    polybar         # system tray
    picom           # compositor
    dmenu           # application launcher
    rofi            # application launcher
    dunst           # notifcation daemon

    # Editors & more
    vim             # terminal editor
    notepadqq       # gui editor 
    vscode          # Text Editor
    tmux            # terminal multiplexer 

    # WMs & related
    herbstluftwm    

    # Hack club
    # sepia           # Mimimalist functional language (@rishiosaur)
    aces            # Custom character set encoder (@quackduck)
  ];
}
