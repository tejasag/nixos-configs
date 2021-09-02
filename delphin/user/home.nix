{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tejasagarwal";
  home.homeDirectory = "/home/tejasagarwal";

  imports = [
    ./programs/neovim.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/kitty.nix
    ./programs/starship.nix
    ./programs/emacs.nix
    ./programs/direnv.nix

  #  ./wm/herbstluftwm.nix
  #  ./wm/xmonad.nix
  ];

  home.packages = with pkgs; [
    git             # version control system
    kitty           # terminal
    herbstluftwm
    fish            # shell
    vim             # terminal editor
    notepadqq       # gui editor 
    firefox         # browser
    nitrogen        # wallpaper dameon
    polybar         # system tray
    picom           # compositor
    dmenu           # application launcher
    rofi            # application launcher
    dunst           # notifcation daemon
    neofetch        # CLI to show system information
    flameshot       # screenshot utility
    wirelesstools   # Wireless CLI utilities
    htop            # System monitor
    discord-canary  # Discord chat app
    slack           # slack chat app
    zoom-us         # Instant meeting app
    killall         # *cough* killall $PERSON_READING *cough*
    spotify         # Music Player
    blender         # 3D Editing software
    gnome.cheese    # Camera app
    gnome.gnome-bluetooth
    insomnia        # REST Client
    ngrok           # proxy tunnel
    discord         # Chat app
    ripgrep         # Recursive file searcher
    coreutils       # basic GNU utilities
    fd              # Faster `find` alternative
    clang           # I am C-peed xD 
    clang-tools     # tools.
    vscode          # Text Editor
    cmake           # Makefile generator
    libtool         # a generic library support script
    pavucontrol     # audio controller
    spotify-tui     # terminal user interface for spotify
    bat             # cat replacement 
    jetbrains.clion    # C/C++ editor by jetbrains
    jetbrains.webstorm # JavaScript editor by jetbrains
    jetbrains.goland   # Golang editor by jetbrains
    jetbrains.idea-ultimate 
    minecraft       # Minecraft. yes.
    multimc         # modded minecraft thingy
    obs-studio
    arduino
    libvterm
    postman
    gnutls
    mu
    isync
    niv
    vlc
    wget
    imagemagick    
    minecraft-server
    blueman
    jdk
  ];


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
 #  home.stateVersion = "21.05";
}
