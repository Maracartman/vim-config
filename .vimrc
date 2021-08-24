" Version 1.1.0
" INFO: required configurations to get it working:
" zsh: https://ohmyz.sh/
" powershell: https://github.com/romkatv/powerlevel10k
" ripgrep: https://github.com/BurntSushi/ripgrep
" USABLE COMMANDS:
" :so% apply changes of file
" NERDTreeNodePlug:
" gt = go to next Tab
" gT = go to previous Tab
set t_Co=256
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
set matchpairs+=<:>
set splitright
set splitbelow
" Set status line display
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
syntax sync fromstart

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

call plug#begin('~/.vim/plugged')
" Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
" Plug 'morhetz/gruvbox'
" Plug 'dikiaap/minimalist'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'itchyny/lightline.vim' "Statusbar customization

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion' " Easy navegation in file
Plug 'scrooloose/nerdtree'  " Display a tree index of the folder
Plug 'christoomey/vim-tmux-navigator' " Navigator for open windows:

Plug 'pangloss/vim-javascript' " JS Support
Plug 'leafgarland/typescript-vim' "TS Support
Plug 'peitalin/vim-jsx-typescript' 
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'https://github.com/digitaltoad/vim-pug'
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }


call plug#end()

" Vim Looking Conf <
if (has("termguicolors"))
 set termguicolors
endif

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline_theme='murmur'
"Theme configuration
" colorscheme minimalist
" colorscheme gruvbox
" colorscheme dracula

" Vim Looking Conf >
" Leader
let mapleader=" "

" Plug args conf <
" NERDTree configurations
let NERDTreeQuitOnOpen=0
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let g:gruvbox_contrast_dark = "dark"
let g:webdevicons_enable_nerdtree = 1

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ ]
" Configure coc prettier or eslint depending of their existance in the folder
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Plug args conf >

" Key mapping <
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nnoremap <silent> <Leader>d :<C-u>CocList diagnostics<cr>
nmap <C-P> :FZF<CR> 
nmap <Leader>f :Rg<CR>
nmap <Leader>gc :GFiles?<CR>
nmap <leader>cp :let @+=expand("%") . ':' . line(".")<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> dy <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
noremap <leader>gs :CocSearch
nnoremap <silent> K :call CocAction('doHover')<CR>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
nnoremap <c-n> :call OpenTerminal()<CR>
" Key mapping >

" Function definitions <
" Show Coc Docs if no Diagnostic
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

" Function definitions >

" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

