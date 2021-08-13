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
" Enable incremental search
set incsearch
set ignorecase
set smartcase
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Themes
Plug 'morhetz/gruvbox'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'easymotion/vim-easymotion' " Easy navegation in file

Plug 'scrooloose/nerdtree'  " Display a tree index of the folder
" Navigator for open windows:
Plug 'christoomey/vim-tmux-navigator'
" Eslint
Plug 'w0rp/ale'

Plug 'pangloss/vim-javascript' " JS Support
Plug 'leafgarland/typescript-vim' "TS Support

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

"Theme configuration
colorscheme gruvbox
"colorscheme dracula

"Plugins related configurations
let g:gruvbox_contrast_dark = "dark"
"Close the menu when a file is opened
let NERDTreeQuitOnOpen=1
" Defines Space as the map leader
let mapleader=" "
" Set ESlint as the linter for JS
let g:ale_fixers = {
      \    'javascript': ['eslint']
      \}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save=1

" Shortcuts
nmap <Leader>s <Plug>(easymotion-s2)
" Abreviately open the menu tree
nmap <Leader>nt :NERDTreeFind<CR>
" Save and quit
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
" Use Ctrl+P to open FZF
nmap <C-P> :FZF<CR> 

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

noremap <leader>gs :CocSearch
noremap <leader>fs :Files<cr>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
