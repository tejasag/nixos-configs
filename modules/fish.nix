{ ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      lx = "natls -lgm";
      ga = "git add";
      gc = "git commit -m $1";
      gp = "git push origin $1";
      commit = "ga . && gc $1";
      s="kitty +kitten ssh";
    };

    functions = {
      nix.body = "IN_NIX_SHELL=impure name=shell command nix $argv";
      pkgs.body = "
        set cmd 'nix shell'
        for i in (string split ' ' $argv)
          set pkg (string join '' 'nixpkgs#' $i)
          set cmd (string join ' ' $cmd $pkg)
        end
        eval $cmd
      ";
      pkgs-unfree.body = "
        set cmd 'NIXPKGS_ALLOW_UNFREE=1 nix shell'
        for i in (string split ' ' $argv)
          set pkg (string join '' 'nixpkgs#' $i)
          set cmd (string join ' ' $cmd $pkg)
        end
        set cmd (string join ' ' $cmd '--impure')
        echo $cmd
        eval $cmd
      ";
    };

    shellInit = ''
      set -x DIRENV_LOG_FORMAT ""
      set -x DOOMDIR "~/.dotfiles/config/doom"
      set fish_greeting
      set EDITOR "vim"
    '';
  };
}
