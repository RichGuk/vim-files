set nocompatible

"
" General settings.
"
set history=1000
set spell

" Searching.
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tags.
set tags=tags;$HOME

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

au FileType javascript setlocal ts=4 sts=4 sw=4
au FileType php setlocal ts=4 sts=4 sw=4
au FileType python setlocal ts=4 sts=4 sw=4

set nowrap
set textwidth=0

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.class

set foldmethod=syntax
set foldnestmax=2
set foldlevelstart=99

syntax on
filetype off

"
" Display settings.
"
set background=dark
if has("gui_running")
  colorscheme railscasts2
else
  colorscheme railscasts_term
endif

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
command! RMTWS :execute '%s/\s\+$//e'

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

" Refresh ctags.
map <leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir \| tail -1`/gems/*<CR><CR>

" Save with sudo.
cmap w!! %!sudo tee > /dev/null %

"
" Plugins.
"
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle.
 Bundle "gmarik/vundle"

" NERDTree.
Bundle "The-NERD-tree"
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>N :NERDTreeFind<CR>

" Nerd Commenter.
Bundle "The-NERD-Commenter"

" Fugitive.
Bundle "fugitive.vim"

" Surround.
Bundle "surround.vim"

" Most recently used.
Bundle "mru.vim"

" DelimitMate
Bundle "delimitMate.vim"

" Supertab.
Bundle "SuperTab-continued."

" Tagbar.
Bundle "Tagbar"

" Ack.
Bundle "ack.vim"

" Ctrl-P.
Bundle "ctrlp.vim"
let g:ctrlp_working_path_mode = 0
let g:ctrlp_jump_to_buffer = 2

" Tabular
Bundle "Tabular"

" Syntastic
Bundle "Syntastic"
let g:syntastic_enable_signs=1

" JShint
Bundle "wookiehangover/jshint.vim"

" Puppet Syntax Highlighting.
Bundle "Puppet-Syntax-Highlighting"

" Github Gists.
Bundle "Gist.vim"

" Slim templates.
Bundle "bbommarito/vim-slim"

" Matchit.
Bundle "matchit.zip"

" Rails.vim
Bundle "tpope/vim-rails"

" Less syntax highlighting.
Bundle "groenewege/vim-less"

" Ruby Debugger.
Bundle "RichGuk/vim-ruby-debugger"
let g:ruby_debugger_create_default_mappings = 0
nmap <leader>db <plug>ruby_debugger_breakpoint
nmap <leader>dv <plug>ruby_debugger_open_variables
nmap <leader>dm <plug>ruby_debugger_open_breakpoints
nmap <leader>dt <plug>ruby_debugger_open_frames
nmap <leader>ds <plug>ruby_debugger_step
nmap <leader>df <plug>ruby_debugger_finish
nmap <leader>dn <plug>ruby_debugger_next
nmap <leader>dc <plug>ruby_debugger_continue
nmap <leader>de <plug>ruby_debugger_exit
nmap <leader>dd <plug>ruby_debugger_remove_breakpoints

" Snipmate + Dependencies.
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

" Needs to be at the end for Vundle.
filetype plugin indent on
