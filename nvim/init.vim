let mapleader="\<Space>"

" ----------------------------------------------------------------------
"  Basic Options
"----------------------------------------------------------------------
syntax enable
autocmd Colorscheme * highlight FullWidthSpace ctermbg=red
autocmd VimEnter * match FullWidthSpace /　/
colorscheme desert
set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set encoding=utf-8
set splitright
set clipboard=unnamedplus
set hls

"----------------------------------------------------------------------
" Key Mappings
"----------------------------------------------------------------------
nnoremap <C-c> y
nnoremap <C-v> p
nnoremap <leader>l $
nnoremap <leader>h ^
nnoremap * *N
vnoremap , <esc>ggVG
nnoremap <C-r> U
nnoremap gt gl
nnoremap gT gh

"----------------------------------------------------------------------
" VSCode
"----------------------------------------------------------------------
if exists('g:vscode')
    " VSCode extension
else
    " ordinary Neovim
endif
