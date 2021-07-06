{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tejasagarwal";
  home.homeDirectory = "/home/tejasagarwal";

  home.packages = with pkgs; [
    git             # version control system
    kitty           # terminal
    fish            # shell
    vim             # terminal editor
    notepadqq       # gui editor 
    firefox         # browser
    pcmanfm         # file browser
    herbstluftwm    # window manager
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
    starship        # shell prompt
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = "colorscheme gruvbox";
    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox
    ];
  };

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

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
