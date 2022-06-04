{ pkgs, ... }:

{
    programs.vim = {
        enable = true;
        settings = {
            expandtab = true;
            shiftwidth = 4;
            tabstop = 4;
        };
        plugins = [];
        extraConfig = ''
            set noeb vb t_vb=
       '';
    };
}
