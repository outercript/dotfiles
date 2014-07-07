" .vimrc
" Author: Oscar Suro
"
" Gathered pieces from all over the net and dozens of dotfiles
" if you like something feel free to use it in your own vimrc.
"
" Happy VIMming!


" Vundle Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:version >= 700 && filereadable(glob("~/.vimrc.plugin"))
    source ~/.vimrc.plugin
endif


" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

set title
set background=dark
set backspace=indent,eol,start

" Always show the status bar
set laststatus=2
set showmode        " Show mode in status bar

" Tabs and indentation
set tabstop=2       " Tab is X spaces
set softtabstop=2   " #spaces to remove on backspace
set shiftwidth=2    " #spaces when auto indent
set shiftround      " Use multiples of shiftwidth with << >>
set expandtab       " Replace tabs with spaces
set smarttab        " Tab on new lines use shiftwith instead of tabstop
set autoindent      " Enable automatic indentation

" Improve default auto complete list
set wildignore+=*.o,*.swp,*.bak,*.pyc,*.class
set wildmode=list:longest
set wildmenu

" Search
set ignorecase      " Ignore case on search
set smartcase       " Auto case sensitive search
set incsearch       " Incremental search

" Others
set nobackup        " No backup file
set nowritebackup   " Don't write it either
set noswapfile      " Don't create a ~.swp file

" Performance stuff
set ttyfast
set lazyredraw

filetype on
filetype plugin on
filetype indent on

highlight OverLength ctermbg=red ctermfg=red
"match OverLength /\%80v.\+/

" White space killer
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/

if exists("&relativenumber")
    set relativenumber
endif


" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveWhiteSpace()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc


" Tricks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Reload changes to .vimrc automatically
"autocmd BufWritePost  ~/.vimrc source ~/.vimrc

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!./% <CR>

" Will allow you to use :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %


" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <F3> :set invpaste paste?<CR>
nnoremap <F4> :call RemoveWhiteSpace()!<CR>
nnoremap <F5> :set invexpandtab expandtab?<CR>
nnoremap <F6> :match OverLength /\%80v.\+/
set pastetoggle=<F3>

nnoremap <space> za
vnoremap <space> zf

" Parentesis/bracket expanding
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
noremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

" Keyboard mapping for numeric keypad
imap <Esc>OM <c-m>
map <Esc>OM <c-m>
imap <Esc>OP <nop>
map <Esc>OP <nop>

imap <Esc>Ol +
imap <Esc>Om -
imap <Esc>On .
imap <Esc>Op 0
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Oz 0
