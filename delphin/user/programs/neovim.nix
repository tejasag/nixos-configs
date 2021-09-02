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
      \ 'coc-haskell',
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

""""""" MICHAEL'S STUFF

" for detecting OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', "", "")
    endif
endif

" important option that should already be set!
set hidden

" available options:
" * g:split_term_style
" * g:split_term_resize_cmd
function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ""horizontal"" or ""vertical"" but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ""horizontal"" or ""vertical"")'
	endif
	exec buffercmd
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec 'term ' . a:command
	exec 'setlocal nornu nonu'
	exec 'startinsert'
	autocmd BufEnter <buffer> startinsert
endfunction

command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++11 %s && ./a.out', expand('%')))
command! -nargs=1 -complete=file CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++11 %s && ./a.out < %s', expand('%'), <q-args>))
autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>

" For those of you that like to use the default ./a.out
" This C++ toolkit gives you commands to compile and/or run in different types
" of terminals for your own preference.
" NOTE: this version is more stable than the other version with specified
" output executable!
augroup CppToolkit
	autocmd!
	if g:os == 'Darwin'
		autocmd FileType cpp nnoremap <leader>fn :!g++ -std=c++11 -o %:r % && open -a Terminal './a.out'<CR>
	endif
	autocmd FileType cpp nnoremap <leader>fb :!g++ -std=c++11 % && ./a.out<CR>
	autocmd FileType cpp nnoremap <leader>fr :!./a.out<CR>
	autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>
augroup END

" For those of you that like to use -o and a specific outfile executable
" (i.e., xyz.cpp makes executable xyz, as opposed to a.out
" This C++ toolkit gives you commands to compile and/or run in different types
" of terminals for your own preference.
augroup CppToolkit
	autocmd!
	if g:os == 'Darwin'
		autocmd FileType cpp nnoremap <leader>fn :!g++ -std=c++11 -o %:r % && open -a Terminal './%:r'<CR>
	endif
	autocmd FileType cpp nnoremap <leader>fb :!g++ -std=c++11 -o %:r % && ./%:r<CR>
	autocmd FileType cpp nnoremap <leader>fr :!./%:r.out<CR>
augroup END

" options
" choose between 'vertical' and 'horizontal' for how the terminal window is split
" (default is vertical)
let g:split_term_style = 'vertical'

" add a custom command to resize the terminal window to your preference
" (default is to split the screen equally)
let g:split_term_resize_cmd = 'vertical resize 40'
" (or let g:split_term_resize_cmd = 'vertical resize 40')
'';
  };
}
