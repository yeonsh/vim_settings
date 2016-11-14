set nocompatible               " be iMproved

set encoding=utf-8
set viminfo=
filetype off                   " required!

call plug#begin('~/.vim/plugged')

"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Distinguished'
Plug 'molokai'
Plug 'Solarized'
Plug 'The-NERD-Commenter'
Plug 'maksimr/vim-jsbeautify'
Plug 'surround.vim'

Plug 'Shougo/neocomplete.vim'

" Languages
Plug 'PyChimp'
Plug 'mitsuhiko/vim-python-combined'
Plug 'vim-scripts/python.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'for': ['go'] }
" python mode
" use python-mode or jedi-vim and sytastic
" to use syntastic install pylint on your virtualenv
Plug 'klen/python-mode'
"Plug 'davidhalter/jedi-vim'
"Plug 'scrooloose/syntastic'

" Git
Plug 'fugitive.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'MatchTag'
Plug 'unimpaired.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh', 'for': 'cpp' }

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Multiple file types
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'tpope/vim-salve', { 'for': ['clojure'] }
Plug 'tpope/vim-projectionist', { 'for': ['clojure'] }
Plug 'tpope/vim-dispatch', { 'for': ['clojure'] }
Plug 'tpope/vim-fireplace', { 'for': ['clojure'] }
Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure'] }

" Haskell
Plug 'dag/vim2hs'

Plug 'IN3D/vim-raml'
Plug 'Konfekt/FastFold'

autocmd! User YouCompleteMe call youcompleteme#Enable()

" Add plugins to &runtimepath
call plug#end()

syntax on
set hlsearch
set nu
set backspace=2
set scrolloff=5

set nobackup
set noswapfile
"set textwidth=80
"set colorcolumn=80
"set colorcolumn=80
"highlight colorcolumn guibg=#000000 ctermbg=246
"set guifont=Monaco:h12
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround      " Round indent to nearest shiftwidth multiple
set incsearch
set showcmd
"set lines=40 columns=100
"set nowrap
set autoindent
set wildignore=*.pyc
"set cursorline
"set wrap
set splitbelow
set splitright
set background=dark

"colorscheme pychimp
"colorscheme Distinguished
"colorscheme delek
"colorscheme evening
colorscheme seoul256
"colorscheme base16-default
"colorscheme koehler
"colorscheme solarized
"colorscheme molokai

nmap <Space> za

" pathogen.vim setting
"execute pathogen#infect()
filetype plugin indent on

let NERDTreeShowBookmarks=1
let g:NERDTreeWinPos = "left"
let g:NERDTreeIgnore = ['.pyc$']
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd 1
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <silent> <C-l> :NERDTreeToggle<CR>
"map <F2> :NERDTreeToggle<CR>
"nmap <silent> <leader>nt :NERDTreeToggle<CR>
"if winwidth(0) < 150
"    autocmd vimenter * NERDTreeToggle
"endif

" Activation based on file type
augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

autocmd! bufwritepost .vimrc source %

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_open_multiple_files = "h"

inoremap <Ctrl-c> <Esc>

autocmd FileType javascript noremap <buffer> <Leader>JJ :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <Leader>JJ :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <Leader>JJ :call CSSBeautify()<cr>

nmap <silent> <leader>ev ;e $MYVIMRC<CR>
nmap <silent> <leader>sv ;so $MYVIMRC<CR>

" go into next line in wrapped lines
nnoremap j gj
nnoremap k gk

"nnoremap ; :
"nnoremap : ;

" Easy window navigation
map <left> <C-w>h
map <down> <C-w>j
map <up> <C-w>k
map <right> <C-w>l

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

command! Wc :r!msg="`curl http://whatthecommit.com/index.txt 2>/dev/null`"; echo "$msg"
command! Wcl :r!msg="`curl http://whatthecommit.com/index.txt 2>/dev/null`"; echo "$msg"; echo "via http://whatthecommit.com/`echo $msg | md5`"

" Airline settings
let g:airline_powerline_fonts = 1
set laststatus=2 
set guifont=Source\ Code\ Pro\ for\ Powerline:h14 "make sure to escape the spaces in the name properly

"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"set list

nnoremap K i<CR><Esc>

"-------------------------
" syntastic
"-------------------------
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"-------------------------
" pymode - Python mode
"-------------------------
let g:pymode = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_lint_on_write = 1
let g:pymode_rope_goto_definition_bind = "<C-]>"

" neocomplete
let g:neocomplete#enable_at_startup = 1
set autochdir
