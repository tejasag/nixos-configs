{ pkgs, ... }:

{
    programs.vim = {
        enable = true;
        settings = {
            expandtab = true;
            shiftwidth = 2;
            tabstop = 2;
            background = "dark";
        };
        plugins = with pkgs.vimPlugins; [
            vim-prettier
        ];
        extraConfig = ''
        set noeb vb t_vb=
        let g:netrw_localrmdir='rm -r'
       '';
    };
}
