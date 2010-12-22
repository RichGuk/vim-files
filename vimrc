set nocompatible
set t_Co=256

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on " Enable plugin and indent file-type configs.
syntax on

if has("gui_running")
	colorscheme railscasts
else
	colorscheme railscasts_term
endif


" Bulk of settings.
set backspace=indent,eol,start " Backspace rules all!
set novisualbell
set noerrorbells

"set incsearch
set hlsearch
set showmatch

set ruler
set number

" Wildmenu settings.
set wildmode=list:longest
set wildmenu

" History settings.
set history=1000

" Wrapping settings.
set wrap
set linebreak

" Fold settings.
set foldmethod=syntax
set foldnestmax=3
set nofoldenable " Don't fold by default.

" Indent settings.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

au FileType php setlocal ts=4 sts=4 sw=4
au FileType python setlocal ts=4 sts=4 sw=4

" List settings, show tab and carriage return.
set listchars=tab:▸\ ,eol:¬
set list

" Configure status line display.
set statusline=%f\ (%{&ff})\ %y%m%r\ [%c,%l/%L]\ %P\ %#warningmsg#%{SyntasticStatuslineFlag()}%*
" Always show the status line.
set laststatus=2

" Enable autocomplete for the languages I tend to work with.
au FileType python set omnifunc=pythoncomplete#Complete
au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP

" PHP options.
au FileType php let php_sql_query=1
au FileType php let php_htmlInStrings=1


" Add some extra locations for ctags.
set tags+=$HOME

" Syntasic settings.
let g:syntastic_enable_signs=1

" Key mappings.
nmap <silent> <C-p> :execute 'NERDTreeToggle ' . getcwd()<CR>
nmap <silent> <D-R> :NERDTreeFind<CR>
nmap ,i :set list!<CR>
nmap <C-S-t> :Tlist<CR>
" Auto complete the current file path.
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Clear searches.
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" Highlight lines longer than 80 cols. For Vim 7.3 use the color column option.
if version >= 703
  highlight ColorColumn ctermbg=lightgrey guibg=#464646
  set cc=+1 tw=80
  nnoremap <Leader>l
        \ :if &cc != '0'<Bar>
        \   set cc=0<Bar>
        \ else<Bar>
        \   set cc=+5<Bar>
        \ endif<CR>
else
  highlight TooLongLines ctermbg=red ctermfg=white guibg=#800000
  au BufWinEnter *.rb,*.php,*.py let w:m1=matchadd('TooLongLines', '\%>80v.\+', -1)
  nnoremap <silent> <Leader>l
    \ :if exists('w:m1') <Bar>
    \   silent! call matchdelete(w:m1) <Bar>
    \   unlet w:m1 <Bar>
    \ elseif &textwidth > 0 <Bar>
    \   let w:m1 = matchadd('TooLongLines', '\%>'.&tw.'v.\+', -1) <Bar>
    \ else <Bar>
    \   let w:m1 = matchadd('TooLongLines', '\%>80v.\+', -1) <Bar>
    \ endif<CR>

endif

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

" Map PHPDoc call.
nnoremap <Leader>cd :call PhpDocSingle()<CR>

" Command to remove trailing whitespace.
command RMTWS :execute '%s/\s\+$//e'
" Command to find all results, matching the current word, in a file, throwing
" the result into a QuickFix list.
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen

" Highlight overrides.
hi CursorColumn term=underline cterm=underline guibg=#333435
" hidden carriage return character
hi NonText ctermbg=NONE ctermfg=235 guifg=#424242 gui=NONE
" hidden tab character
hi SpecialKey ctermbg=NONE ctermfg=235 guifg=#424242 gui=NONE
