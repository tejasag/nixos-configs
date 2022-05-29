{ pkgs, ... }:

{
    programs.vim = {
        enable = true;
        settings = {
            expandtab = true;
            shiftwidth = 4;
            tabstop = 4;
        };
    };
}

