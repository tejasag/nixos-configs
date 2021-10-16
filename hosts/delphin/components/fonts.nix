# https://github.com/alternateved/nixos-config/blob/7652ceb9f68d650cecf6ccb66dd46eb340691c2b/hosts/teishi/default.nix#L76
{ pkgs, ... }: 

{
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
}
