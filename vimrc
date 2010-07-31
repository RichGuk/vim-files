set novisualbell
set noerrorbells
set hlsearch
set nocompatible
set showmatch
set cursorline
set cursorcolumn
set ruler
set number
set spell
set wildmenu
set history=1000
" Wrapping settings.
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

" Global indent settings.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

syntax on
colorscheme railscasts

filetype plugin indent on

" Key mappings.
map <C-p> :execute 'NERDTreeToggle ' . getcwd()<CR>
map <D-R> :NERDTreeFind<CR>
map ,i :set list!<CR>
map <C-S-t> :Tlist<CR>

" Highlight lines longer than 80 cols.
highlight TooLongLines ctermbg=red ctermfg=white guibg=#800000
:au BufWinEnter * let m1=matchadd('TooLongLines', '\%>80v.\+', -1)
:au BufWinEnter *.html,*.haml,*.markdown,*.mdown,*.textile call matchdelete(m1)
" Highlight trailing whitespace.
match Search /\s\+$/
 
" Command to remove trailing whitespace.
command RMTWS :execute '%s/\s\+$//'
" Command to find all results, matching the current word, in a file, throwing
" the result into a QuickFix list.
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen
