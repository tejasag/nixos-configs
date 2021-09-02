{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      lx = "natls -lgm";
      cax = "bat";
      nix-fish = "nix-shell --command 'fish'";
    };
    shellInit = ''
      set -x DIRENV_LOG_FORMAT ""
      set -x DOOMDIR "~/.dotfiles/.doom.d"
    '';
  };
}
