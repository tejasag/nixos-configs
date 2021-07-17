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
      starship init fish | source
    '';
  };
}
