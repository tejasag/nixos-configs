{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Window Managers  
      ../../modules/window-managers/herbstluftwm.nix
      #../../modules/window-managers/xmonad.nix

      # ../../modules/lightdm
    ];

  # boot
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # internationlisation
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    # printing
    printing.enable = true;

    # ssh  
    openssh.enable = true;

    # xserver
    xserver = {
      enable = true;

      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;

      layout = "us";
      xkbOptions = "eurosign:e";

      libinput.enable = true;
    };
  };

  # networking
  networking = {
    hostName = "delphin";
    useDHCP = false;
    interfaces = {
      eno1.useDHCP = true;
      wlp2s0.useDHCP = true;
    };
  };

  # User
  users.users.tejasagarwal = {
	isNormalUser = true;
	extraGroups = [ "wheel" ];
	shell = pkgs.fish;
  };

  # Fonts
  # https://github.com/alternateved/nixos-config/blob/7652ceb9f68d650cecf6ccb66dd46eb340691c2b/hosts/teishi/default.nix#L76
  fonts = {
      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [ "Iosevka Nerd Font" ];
          serif = [ "Iosevka Etoile" ];
          sansSerif = [ "Iosevka Aile" ];
        };
      };
      fonts = with pkgs; [
        (iosevka-bin.override { variant = "aile"; })
        (iosevka-bin.override { variant = "etoile"; })
        (nerdfonts.override { fonts = [ "Iosevka" ]; })
      ];
    };

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # time
  time.timeZone = "Asia/Kolkata";

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      experimental-features = nix-command flakes
    '';
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    binaryCaches = [
      "https://hackclub.cachix.org"
      "https://nix-community.cachix.org"
    ];
    binaryCachePublicKeys = [
      "hackclub.cachix.org-1:O2CuNZHdaWuoZw/GIl92H5boypRcgU7QpjrjKo3/AjE="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  system.stateVersion = "21.05"; 
}
