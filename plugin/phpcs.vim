"function! RunPhpcs()
    "let l:filename=@%
    "let l:phpcs_output=system('phpcs --report=csv --standard=Namesco '.l:filename)
""    echo l:phpcs_output
    "let l:phpcs_list=split(l:phpcs_output, "\n")
    "unlet l:phpcs_list[0]
    "cexpr l:phpcs_list
	"copen 
"endfunction

"set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"
"command! Phpcs execute RunPhpcs()

set errorformat+=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"\\,%*[a-zA-Z0-9_.-]

function! RunPhpcs() 
	let l:quote_token="'"
	let l:filename=@% 
	let l:phpcs_output=system('phpcs --report=csv --standard=Namesco '.l:filename) 
	let l:phpcs_output=substitute(l:phpcs_output, '\\"', l:quote_token, 'g')
	let l:phpcs_list=split(l:phpcs_output, "\n") 
	unlet l:phpcs_list[0] 
	cexpr l:phpcs_list 
	cwindow 
endfunction 
command! Phpcs execute RunPhpcs()

