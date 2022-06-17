{ config, pkgs, master, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ../modules/neovim.nix
    ../modules/fish.nix
    ../modules/git.nix
    ../modules/kitty.nix
    ../modules/starship.nix
    ../modules/emacs.nix
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
    deno
    dunst
    eww
    firefox
    fish
    flameshot
    gcc
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
    
    nodePackages.pnpm
    nodePackages.prettier
  ]) ++ (with master; [
    discord-canary
  ]);
}
