set nocompatible

colorscheme railscasts
filetype plugin indent on " Enable plugin and indent file-type configs.
syntax on

" Bulk of settings.
set backspace=indent,eol,start " Backspace rules all!
set novisualbell
set noerrorbells
set hlsearch
set showmatch

" Cursor options.
set cursorline
set cursorcolumn
au FileType diff setlocal nocursorcolumn

set ruler
set number
set spell

" Wildmenu settings.
set wildmode=list:longest
set wildmenu

" History settings.
set history=1000

" Wrapping settings.
set wrap
set linebreak

" Fold settings.
set foldmethod=indent
set foldnestmax=3
set nofoldenable " Don't fold by default.

" Indent settings.
set ts=2 sts=2 sw=2 expandtab autoindent
au FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
au FileType python setlocal ts=4 sts=4 sw=4 expandtab

" List settings, show tab and carriage return.
set list
set listchars=tab:➔\ ,eol:↵

" Configure status line display.
set statusline=%f
" Show fileformat.
set statusline+=(%{&ff})
set statusline+=%y " Filetype.
set statusline+=%r " Read only.
set statusline+=%m " Modified.
" Line information.
set statusline+=%c,
set statusline+=%l/%L
set statusline+=\ %P
" Always show the status line.
set laststatus=2

" Syntastic statusline stuff.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Enable autocomplete for the languages I tend to work with.
au FileType python set omnifunc=pythoncomplete#Complete
au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP

" Syntasic settings.
let g:syntastic_enable_signs=1

" Key mappings.
nmap <silent> <C-p> :execute 'NERDTreeToggle ' . getcwd()<CR>
nmap <silent> <D-R> :NERDTreeFind<CR>
nmap ,i :set list!<CR>
nmap <C-S-t> :Tlist<CR>
" Clear searches.
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Highlight lines longer than 80 cols.
highlight TooLongLines ctermbg=red ctermfg=white guibg=#800000
au BufWinEnter *.rb,*.php,*.py let w:m1=matchadd('TooLongLines', '\%>80v.\+', -1)
" Setup a toggle.
nnoremap <silent> <Leader>l
  \ :if exists('w:m1') <Bar>
  \   silent! call matchdelete(w:m1) <Bar>
  \   unlet w:m1 <Bar>
  \ elseif &textwidth > 0 <Bar>
  \   let w:m1 = matchadd('TooLongLines', '\%>'.&tw.'v.\+', -1) <Bar>
  \ else <Bar>
  \   let w:m1 = matchadd('TooLongLines', '\%>80v.\+', -1) <Bar>
  \ endif<CR>

" Highlight trailing whitespace.
hi link TrailingWhiteSpace Search
au BufWinEnter * let w:twsm=matchadd('TrailingWhiteSpace', '\s\+$')
" Setup a toggle.
nnoremap <silent> <Leader>w
  \ :if exists('w:twsm') <Bar>
  \   silent! call matchdelete(w:twsm) <Bar>
  \   unlet w:twsm <Bar>
  \ else <Bar>
  \   let w:twsm = matchadd('TrailingWhiteSpace', '\s\+$') <Bar>
  \ endif<CR>

" Command to remove trailing whitespace.
command RMTWS :execute '%s/\s\+$//e'
" Command to find all results, matching the current word, in a file, throwing
" the result into a QuickFix list.
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen

" Highlight overrides.
hi CursorColumn term=underline cterm=underline guibg=#333435
" hidden carriage return character
hi NonText ctermfg=1 guifg=#5C5C5C gui=NONE
" hidden tab character
hi SpecialKey ctermfg=1 guifg=#5C5C5C gui=NONE
