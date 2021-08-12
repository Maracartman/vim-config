" Version 0.1.0
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
" Easy navegation in file
Plug 'easymotion/vim-easymotion'
" Display a tree index of the folder
Plug 'scrooloose/nerdtree'

" Eslint
Plug 'w0rp/ale'

Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

colorscheme gruvbox

let g:gruvbox_contrast_dark = "dark"

"Close the menu when a file is opened
let NERDTreeQuitOnOpen=1

" Defines Space as the map leader
let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
" Abreviately open the menu tree
nmap <Leader>nt :NERDTreeFind<CR>

" Set ESlint as the linter for JS
let g:ale_fixers = {
      \    'javascript': ['eslint']
      \}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save=1


