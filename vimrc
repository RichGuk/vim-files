set nocompatible

syntax on
colorscheme railscasts
filetype plugin indent on " Enable plugin and indent file-type configs.

" Bulk of settings.
set novisualbell
set noerrorbells
set hlsearch
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
" List settings, show tab and carriage return.
set list
set listchars=tab:➔\ ,eol:↵


" Configure status line display.
set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntasic settings.
let g:syntastic_enable_signs=1

" Key mappings.
map <C-p> :execute 'NERDTreeToggle ' . getcwd()<CR>
map <D-R> :NERDTreeFind<CR>
map ,i :set list!<CR>
map <C-S-t> :Tlist<CR>

" Highlight lines longer than 80 cols.
highlight TooLongLines ctermbg=red ctermfg=white guibg=#800000
au BufWinEnter *.rb,*.php,*.py let m1=matchadd('TooLongLines', '\%>80v.\+', -1)
" Highlight trailing whitespace.
au BufWinEnter * let twsm=matchadd('Search', '\s\+$')

" Command to remove trailing whitespace.
command RMTWS :execute '%s/\s\+$//'
" Command to find all results, matching the current word, in a file, throwing
" the result into a QuickFix list.
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen

" Highlight overrides.
hi CursorColumn term=underline cterm=underline guibg=#333435
" hidden carriage return character
hi NonText ctermfg=1 guifg=#757575 gui=NONE
" hidden tab character
hi SpecialKey ctermfg=1 guifg=#757575 gui=NONE
