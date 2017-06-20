set nocompatible               " be iMproved

set encoding=utf-8
set viminfo=
filetype off                   " required!

call plug#begin('~/.vim/plugged')

Plug 'rizzatti/dash.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'The-NERD-Commenter'
Plug 'maksimr/vim-jsbeautify'
Plug 'surround.vim'
Plug 'tpope/vim-repeat'

"Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Konfekt/FastFold' " required by neocomplete

" Languages
Plug 'mitsuhiko/vim-python-combined'
Plug 'vim-scripts/python.vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'garyburd/go-explorer', { 'for': ['go'] }
Plug 'majutsushi/tagbar'
" python mode
" use python-mode or jedi-vim and sytastic
" to use syntastic install pylint on your virtualenv
"Plug 'davidhalter/jedi-vim'
"Plug 'scrooloose/syntastic'
" or
Plug 'python-mode/python-mode'
Plug 'vim-scripts/gtags.vim'

" Git
Plug 'fugitive.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'MatchTag'
Plug 'unimpaired.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh', 'for': 'cpp' }

Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Multiple file types
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'tpope/vim-salve', { 'for': ['clojure'] }
Plug 'tpope/vim-projectionist', { 'for': ['clojure'] }
Plug 'tpope/vim-dispatch', { 'for': ['clojure'] }
Plug 'tpope/vim-fireplace', { 'for': ['clojure'] }
"Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure'] }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['clojure'] }

" Haskell
Plug 'dag/vim2hs'

Plug 'IN3D/vim-raml'
Plug 'Konfekt/FastFold'

" Color schemes
Plug 'zanglg/nova.vim'
Plug 'albertorestifo/github.vim'
Plug 'PyChimp'
Plug 'cesardeazevedo/Fx-ColorScheme'
Plug 'Distinguished'
Plug 'molokai'
Plug 'Solarized'
Plug 'agude/vim-eldar'

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

"colorscheme pychimp
"colorscheme Distinguished
colorscheme delek
"colorscheme evening
colorscheme seoul256
"colorscheme base16-default
"colorscheme koehler
"colorscheme solarized
"colorscheme fx
"colorscheme molokai
"colorscheme github
"colorscheme nova
"colorscheme eldar

set background=dark
let g:seoul256_background=0

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

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <F8> :TagbarToggle<CR>

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
let g:airline_powerline_fonts = 0
set laststatus=2 
set guifont=Source\ Code\ Pro\ for\ Powerline:h14 "make sure to escape the spaces in the name properly
"set guifont=Consolas\ for\ Powerline:h14 "make sure to escape the spaces in the name properly

"exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
"set list

"nnoremap K i<CR><Esc>

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
" Ultisnips
"-------------------------
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"-------------------------
" pymode - Python mode
"-------------------------
let g:pymode = 1
"let g:pymode_rope_lookup_project = 0
"let g:pymode_lint_on_write = 1
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
"let g:pymode_python ='python'
let g:pymode_virtualenv = 1
let g:pymode_lint_ignore = "E501"

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" neosnippet. Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
      set conceallevel=0 concealcursor=niv
endif

"set autochdir
let g:surround_{char2nr('o')} = "{{{\r}}}"

" golang mapping
au FileType go nmap <F10> :GoDef<CR>
au FileType go nmap <silent> <leader>gd :GoDef<CR>
au FileType go nmap <silent> <leader>ga :GoDoc<CR>
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_interfaces = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1


" tagbar
nmap <Leader>tb :TagbarToggle<CR>

nmap =j :%!python -m json.tool<CR>

"-----------------------------------------------
" easymotion
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

"map / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Gtags
nmap <C-><C-]> :GtagsCursor<CR>
au FileType cpp nmap <Leader>gd :GtagsCursor<CR>
"au FileType h nmap <Leader>gd :GtagsCursor<CR>

