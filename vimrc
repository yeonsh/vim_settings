"---------Vundle-------------
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'
Bundle 'mitsuhiko/vim-python-combined'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Auto-Pairs'
Bundle 'PyChimp'
Bundle 'Distinguished'
Bundle 'molokai'
Bundle 'Solarized'
Bundle 'The-NERD-Commenter'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'surround.vim'
" Git
Bundle 'fugitive.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/python.vim'
Bundle 'MatchTag'

filetype plugin indent on " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"-------------------------------

syntax on
set nobackup
set noswapfile
"set textwidth=80
"set colorcolumn=80
"set guifont=Monaco:h12
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set incsearch
set hlsearch
set nu
set showcmd
"set lines=40 columns=100
"set nowrap
set autoindent
set wildignore=*.pyc
set cursorline
"set wrap
set splitbelow
set splitright
set background=dark
"colorscheme PyChimp
"colorscheme Distinguished
"colorscheme delek
"colorscheme evening
colorscheme molokai
"colorscheme koehler
"colorscheme solarized

" pathogen.vim setting
"execute pathogen#infect()
filetype plugin indent on

let NERDTreeShowBookmarks=1
let g:NERDTreeWinPos = "left"
autocmd vimenter * NERDTree
autocmd vimenter * wincmd 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <silent> <C-l> :NERDTreeToggle<CR>
"map <F2> :NERDTreeToggle<CR>
"nmap <silent> <leader>nt :NERDTreeToggle<CR>
if winwidth(0) < 150
    autocmd vimenter * NERDTreeToggle
endif

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
set guifont=Source\ Code\ Pro\ for\ Powerline:h12 "make sure to escape the spaces in the name properly

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

nnoremap K i<CR><Esc>

