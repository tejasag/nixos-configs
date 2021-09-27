#                                                                   ___
#                   __                                             /'___\  __
#     ___    __  __ /\_\     ___ ___         ___     ___     ___  /\ \__/ /\_\      __
#   /' _ `\ /\ \/\ \\/\ \  /' __` __`\      /'___\  / __`\ /' _ `\\ \ ,__\\/\ \   /'_ `\
#   /\ \/\ \\ \ \_/ |\ \ \ /\ \/\ \/\ \    /\ \__/ /\ \L\ \/\ \/\ \\ \ \_/ \ \ \ /\ \L\ \
#   \ \_\ \_\\ \___/  \ \_\\ \_\ \_\ \_\   \ \____\\ \____/\ \_\ \_\\ \_\   \ \_\\ \____ \
#   \/_/\/_/ \/__/    \/_/ \/_/\/_/\/_/    \/____/ \/___/  \/_/\/_/ \/_/    \/_/ \/___L\ \
#                                                                                   /\____/
#                                                                                   \_/__/

{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      rust-vim
      haskell-vim
      gruvbox
      coc-nvim
      coc-clangd
      nerdtree
      yats-vim
      vim-devicons
      vim-nerdtree-syntax-highlight
      vim-polyglot
    ];
    extraConfig = ''
colorscheme gruvbox
let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_Dark="hard"
let g:rustfmt_autosave = 1

set relativenumber number
set tabstop=4
set shiftwidth=4
set expandtab
set guicursor=n-v-c-i:blinkon0
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

"let g:coc_node_path="/nix/store/d0z9k8dpd4ryalfmnyaahybri8p49ibs-nodejs-14.17.5/bin/node"
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-clangd',
      \ 'coc-css',
      \ 'coc-elixir',
      \ 'coc-eslint',
      \ 'coc-flutter',
      \ 'coc-go',
      \ 'coc-graphql',
      \ 'coc-html',
      \ 'coc-prettier',
      \ 'coc-rls',
      \ 'coc-rust-analyzer',
      \ 'coc-prisma',
      \ 'coc-python',
      \ 'coc-rome',
      \ 'coc-svelte',
      \ 'coc-sql',
      \ 'coc-tailwindcss',
      \ 'coc-toml',
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-yank',
      \ 'coc-pairs',
      \ 'coc-snippets']

function! NERDTreeToggleInCurDir()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != "")
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

let g:NERDTreeWinPos = "right"
nmap <C-n> :call NERDTreeToggleInCurDir()<CR>
'';
  };
}
