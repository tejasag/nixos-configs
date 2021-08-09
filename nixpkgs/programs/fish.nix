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
      set -x JAVA_HOME "/home/tejasagarwal/.nix-profile"
      starship init fish | source
    '';
  };
}
