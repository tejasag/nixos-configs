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
      gruvbox
      nerdtree
      yats-vim
      vim-devicons
      vim-nerdtree-syntax-highlight
      vim-polyglot
    ];
    coc = {
      enable = true;
      settings = {
        "coc.preferences.formatOnSaveFiletypes" = [
          "css"
          "markdown"
          "javascript"
          "typescript"
          "graphql"
          "javascriptreact"
          "typescriptreact"
          "json"
          "typescript.tsx"
          "rust"
          "haskell"
        ];
        "rust-client.disableRustup" = true;
        languageserver = {
          haskell = {
            command = "haskell-language-server-wrapper";
            args = [
              "--lsp"
            ];
            rootPatterns = [
              ".stack.yaml"
              ".hie-bios"
              "BUILD.bazel"
              "cabal.config"
              "*.cabal"
              "cabal.project"
              "hie.yaml"
              "package.yaml"
            ];
            filetypes= [
              "hs"
              "lhs"
              "haskell"
            ];
          };
        };
    };
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
