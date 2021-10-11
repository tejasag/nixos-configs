#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#                     
{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      lx = "natls -lgm";
      nix-fish = "nix-shell --command 'fish'";
      ga = "git add";
      gc = "git commit -m $1";
      gp = "git push origin $1";
    };
    shellInit = ''
      set -x DIRENV_LOG_FORMAT ""
      set -x DOOMDIR "~/.dotfiles/.doom.d"
    '';
  };
}
