{ config, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix 
    ../../modules/window-managers/herbstluftwm.nix 
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    printing.enable = true;
    openssh.enable = true;
    xserver = {
      enable = true;

      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;

      layout = "us";
      xkbOptions = "eurosign:e";

      libinput.enable = true;
    };
  };

  networking = {
    hostName = "delphin";
    useDHCP = false;
    interfaces = {
      eno1.useDHCP = true;
      wlp2s0.useDHCP = true;
    };
  };

  users.users.tejasagarwal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Victor Mono Semibold Nerd Font Complete" ];
      };
    };
    fonts = with pkgs; [
      victor-mono
      (nerdfonts.override { fonts = [ "VictorMono" "FantasqueSansMono" ]; })
    ];
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  time.timeZone = "Asia/Kolkata";

  # enable fish for completions
  programs.fish.enable = true;

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      substituters = [
        "https://hackclub.cachix.org"
        "https://nix-community.cachix.org"
        "https://cache.nixos.org"
      ];
      trusted-public-keys = [
        "hackclub.cachix.org-1:O2CuNZHdaWuoZw/GIl92H5boypRcgU7QpjrjKo3/AjE="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
  };

  system.stateVersion = "21.05"; 
}
