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
      nvim-tree-lua
      nvim-web-devicons
      vim-polyglot
      vim-airline
      vim-airline-themes
      coc-nvim
      coc-tabnine
      nord-nvim
      telescope-nvim
    ];
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

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-css',
      \ 'coc-eslint',
      \ 'coc-html',
      \ 'coc-prettier',
      \ 'coc-rust-analyzer',
      \ 'coc-python',
      \ 'coc-svelte',
      \ 'coc-tailwindcss',
      \ 'coc-toml',
      \ 'coc-tsserver',
      \ 'coc-yank',
      \ 'coc-pairs',
      \ 'coc-snippets']

"function! NERDTreeToggleInCurDir()
"  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
"    exe ":NERDTreeClose"
"  else
"   if (expand("%:t") != "")
"    exe ":NERDTreeFind"
"    else
"      exe ":NERDTreeToggle"
"    endif
"  endif
"endfunction

"let g:NERDTreeWinPos = "right"
"nmap <C-n> :call NERDTreeToggleInCurDir()<CR>

let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set renderer.indent_markers.enable (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': "",
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set nosplitright

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua << EOF
     require'nvim-tree'.setup {
     }
EOF
'';
  };
}
