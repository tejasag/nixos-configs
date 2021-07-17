{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox
      coc-nvim
      nerdtree
    ];
    extraConfig = ''
colorscheme gruvbox
let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_Dark="hard"

set relativenumber number

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-clangd',
      \ 'coc-css',
      \ 'coc-elixir',
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
