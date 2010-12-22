" Disable audio/visual bells in macvim.
set vb
set guifont=Meslo\ LG\ M\ DZ:h11

set spell
" Disable spell checking for SQL, becomes a little distracting.
au FileType sql,mysql,plsql setlocal nospell

" Hide MacVim toolbar.
set guioptions-=T
