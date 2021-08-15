" Version 0.2.0
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
set hidden
" Enable incremental search
set incsearch
set ignorecase
set smartcase
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
syntax sync fromstart

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

call plug#begin('~/.vim/plugged')
" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion' " Easy navegation in file
Plug 'scrooloose/nerdtree'  " Display a tree index of the folder
Plug 'christoomey/vim-tmux-navigator' " Navigator for open windows:

Plug 'pangloss/vim-javascript' " JS Support
Plug 'leafgarland/typescript-vim' "TS Support
Plug 'peitalin/vim-jsx-typescript' " TODO: Look for Deprecation
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
call plug#end()

"Theme configuration
" colorscheme gruvbox
colorscheme dracula

"Plugins related configurations
let g:gruvbox_contrast_dark = "dark"
"Close the menu when a file is opened
let NERDTreeQuitOnOpen=1
" Defines Space as the map leader
let mapleader=" "
" Set ESlint as the linter for JS

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
" Configure coc prettier or eslint depending of their existance in the folder
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Shortcuts
nmap <Leader>s <Plug>(easymotion-s2)
" Abreviately open the menu tree
nmap <Leader>nt :NERDTreeFind<CR>
" Save and quit
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nnoremap <silent> <Leader>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <Leader>s :<C-u>CocList -I symbols<cr>

" Use Ctrl+P to open FZF
nmap <C-P> :FZF<CR> 

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> dy <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
noremap <leader>gs :CocSearch
noremap <leader>fs :Files<cr>
" Use K to show documentation in preview window.
nnoremap <silent> K :call CocAction('doHover')<CR>

" Show Coc Docs if no Diagnostic
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
