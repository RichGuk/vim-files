set nocompatible

"
" General settings.
"
set history=1000
set timeoutlen=200
set clipboard+=unnamed " Yanks into clipboard (trying).
set spell

" Searching.
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remember last location in file.
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

"
" Formatting settings.
"
set backspace=indent,eol,start " Backspacing FTW.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set nowrap
set textwidth=0

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.class

syntax on
filetype plugin indent on


"
" Display settings.
"
set laststatus=2 " Always show status bar.
set number
set ruler
set novisualbell
set noerrorbells
set vb t_vb=
set list listchars=tab:▸\ ,eol:¬ " Show tabs and new line 'hidden' characters.

" Highlight trailing whitespace!
hi link TrailingWhiteSpace Search
au BufWinEnter * let w:twsm=matchadd('TrailingWhiteSpace', '\s\+$')

hi CursorColumn term=underline cterm=underline guibg=#333435
" hidden carriage return character.
hi NonText ctermbg=NONE ctermfg=235 guifg=#424242 gui=NONE
" hidden tab character.
hi SpecialKey ctermbg=NONE ctermfg=235 guifg=#424242 gui=NONE

" Highlight long lines.
if version >= 703
  highlight ColorColumn ctermbg=lightgrey guibg=#464646
  set cc=+1 tw=80
endif

"
" Mappings and Commands
"
" Remove trailing whitespace with :RMTWS.
command RMTWS :execute '%s/\s\+$//e'

" Toggle long lines highlight.
if version >= 703
  nnoremap <leader>tl
    \ :if &cc != '0'<Bar>
    \   set cc=0<Bar>
    \ else<Bar>
    \   set cc=+5<Bar>
    \ endif<CR>
endif

" Toggle trailing whitespace highlight.
nnoremap <silent> <Leader>w
            \ :if exists('w:twsm') <Bar>
            \   silent! call matchdelete(w:twsm) <Bar>
            \   unlet w:twsm <Bar>
            \ else <Bar>
            \   let w:twsm = matchadd('TrailingWhiteSpace', '\s\+$') <Bar>
            \ endif<CR>

" Mapping to clear search HL.

map <leader>sc :nohls<CR><C-L>

" Mappings to expand the current path (edit, split, vsplit)
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Tab mappings.
map ,tc :tabclose<CR>
map ,tn :tabnew<CR>
map <silent> ,[ :tabprev<CR>
map <silent> ,>] :tabnext<CR>

" Toggle list characters.
map <leader>tc :set invlist<CR>
