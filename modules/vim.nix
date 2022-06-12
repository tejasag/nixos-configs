{ pkgs, ... }:

{
    programs.vim = {
        enable = true;
        settings = {
            expandtab = true;
            shiftwidth = 4;
            tabstop = 4;
            background = "dark";
        };
        plugins = with pkgs.vimPlugins; [
            vim-prettier
        ];
        extraConfig = ''
        set noeb vb t_vb=
       '';
    };
}
