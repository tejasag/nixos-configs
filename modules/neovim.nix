#   ______  ______    
#  /\__  _\/\  __ \     
#  \/_/\ \/\ \  __ \    By Tejas Agarwal 
#     \ \_\ \ \_\ \_\   https://github.com/tejasag 
#      \/_/  \/_/\/_/ 
#      
{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      nvim-web-devicons
      vim-polyglot
      vim-parinfer
      nord-nvim
      telescope-nvim
      nerdtree
      yats-vim

      vim-airline
      vim-airline-themes

      coc-tabnine
      coc-json
      coc-git 
      coc-css
      coc-eslint
      coc-html
      coc-prettier
      coc-rust-analyzer
      coc-python
      coc-svelte
      coc-tsserver
      coc-pairs
    ];

   coc = {
      enable = true;
      package = pkgs.vimUtils.buildVimPluginFrom2Nix {
        pname = "coc.nvim";
        version = "2022-05-21";
        src = pkgs.fetchFromGitHub {
          owner = "neoclide";
          repo = "coc.nvim";
          rev = "791c9f673b882768486450e73d8bda10e391401d";
          sha256 = "sha256-MobgwhFQ1Ld7pFknsurSFAsN5v+vGbEFojTAYD/kI9c=";
        };
        meta.homepage = "https://github.com/neoclide/coc.nvim/";
      };
   };
      	
   extraConfig = ''
set termguicolors

colorscheme nord
let g:airline_theme  = 'nord_minimal'

autocmd filetype cpp nnoremap <f9> :w <bar> !g++ -std=c++14 % -o %:r<cr> 
autocmd filetype cpp nnoremap <F10> :!./%:r<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

set relativenumber number
set tabstop=4
set shiftwidth=4
set expandtab
set guicursor=n-v-c-i:blinkon0
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none

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
