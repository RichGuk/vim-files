" Disable audio/visual bells in macvim.
set vb
set guifont=Monaco:h12

set spell
" Disable spell checking for SQL, becomes a little distracting.
au FileType sql,mysql,plsql setlocal nospell
