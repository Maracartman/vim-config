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
set nocompatible
filetype off
set t_Co=256
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set cursorline
set encoding=utf-8
set termencoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set hidden
set incsearch
set nohlsearch
set ignorecase
set smartcase
set matchpairs+=<:>
set matchpairs+=":"
set matchpairs+=':'
set splitright
set splitbelow
set autoindent
set cindent
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab
set noswapfile
syntax sync fromstart
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  " set signcolumn=number
  set signcolumn=yes
else
  set signcolumn=yes
endif

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

Plug 'christoomey/vim-tmux-navigator' " Navigator for open windows:
Plug 'scrooloose/nerdtree'  " Display a tree index of the folder Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

Plug 'easymotion/vim-easymotion' " Easy navegation in file

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pangloss/vim-javascript' " JS Support
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/jsonc.vim'
Plug 'leafgarland/typescript-vim' "TS Support
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components'
"Plug 'digitaltoad/vim-pug'
"Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
"Plug 'peitalin/vim-jsx-typescript' 
call plug#end()
filetype plugin on

" Vim Looking Conf <
syntax enable
set background=dark
if (has("termguicolors"))
 set termguicolors
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline_theme='molokai'
"Theme configuration
" colorscheme minimalist
colorscheme gruvbox
"colorscheme dracula
"colorscheme nord

" Vim Looking Conf >


" Plug args conf <
" NERDTree configurations
let NERDTreeQuitOnOpen=1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
"let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeStatusline = ''

let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:gruvbox_contrast_dark = "dark"
let g:webdevicons_enable_nerdtree = 1

let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json'
  \ ]

" Configure coc prettier or eslint depending of their existance in the folder
"if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  "let g:coc_global_extensions += ['coc-prettier']
"else 
  "let g:coc_global_extensions += ['coc-eslint']
"endif

" Plug args conf >

" Leader
let mapleader=" "

" Key mapping <
"
" INSERT MODE mapping
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"EXECUTION MODE mapping
xmap <leader>f  <Plug>(coc-format-selected)
" VIRTUAL MODE mapping
vmap ++ <plug>NERDCommenterToggle
" NORMAL MODE mapping
nmap ++ <plug>NERDCommenterToggle
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <C-P> :FZF<CR> 
nmap <Leader>f :Rg<CR>
nmap <Leader>gc :GFiles?<CR>
nmap <leader>cp :let @+=expand("%") . ':' . line(".")<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> dy <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> <Plug>(coc-diagnostic-next)
nmap <silent><c-space> :CocAction<CR>
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <F2> <Plug>(coc-rename)
" nmap ]h <Plug>(GitGutterNextHunk)
" nmap [h <Plug>(GitGutterPrevHunk)
noremap <leader>gs :CocSearch
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <C-c> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>d :<C-u>CocList diagnostics<cr>
" turn terminal to normal mode with escape
nnoremap <c-n> :call ToggleTerminal()<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <c-n>  <C-\><C-n>:call ToggleTerminal()<CR>
" Key mapping >

" Function definitions <
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"TODO Delete this function
" Show Coc Docs if no Diagnostic
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

" TODO Delete this function
function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

" open terminal on ctrl+n
function! ToggleTerminal()
  let running = jobwait([&channel], 0)[0] == -1
  if(!running)
    split term://zsh
    resize 10
  else
    quit
  endif
endfunction

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" NerdTree
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree() Fix problem with it
autocmd BufEnter NERD_tree_* | execute 'normal R'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" TODO Delete this line
autocmd CursorHold * :call <SID>show_hover_doc()
autocmd CursorHold * silent call CocActionAsync('highlight')

" Treat all json files as jsonc
augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END

" Spellcheck for features and markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

" Coc autocompletition config
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  let g:coc_snippet_next = '<tab>'
