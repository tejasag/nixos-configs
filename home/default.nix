{ config, pkgs, master, ... }:

{
  programs.home-manager.enable = true;
  home.username = "tejasagarwal";
  home.homeDirectory = "/home/tejasagarwal";

  imports = [
    ../modules/neovim.nix
    ../modules/fish.nix
    ../modules/git.nix
    ../modules/kitty.nix
    ../modules/starship.nix
#    ../modules/emacs.nix
    ../modules/direnv.nix
    ../modules/zoxide.nix
    ../modules/vim.nix
  ];

  home.packages = (with pkgs; [
    h               # hydrogen.

    arduino
    bashly
    bat
    binutils
    blender
    blueman
    brave
    cargo
    conky
    dunst
    firefox
    fish
    flameshot
    git
    gimp
    gnome.cheese
    gnome.gnome-bluetooth
    gnupg
    gnutls
    htop
    imagemagick
    insomnia
    killall
    minecraft
    nasm
    neofetch
    ngrok
    nitrogen
    niv
    nodejs
    obs-studio
    pavucontrol
    picom
    pinentry
    polybarFull
    python3
    ranger
    ripgrep
    rofi
    slack
    spotify
    thunderbird
    virtualbox
    vlc
    vscode
    wget
    wirelesstools
    yarn
    zoom-us
    
    nodePackages.prettier
  ]) ++ (with master; [
    (callPackage ../pkgs/discord-canary { unwraped = master.discord-canary; })
    #discord-canary
    eww
  ]);
}
