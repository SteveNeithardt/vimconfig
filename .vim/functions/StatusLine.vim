:function! StatusLine()
:  let l:file = '%<%F'
:  let l:ff = '[%{&fileformat}] '
:  let l:buf = '%n '
:  let l:flags = ' %h%m%r'
:  let l:middle = '%='
" :  let l:timeformat = '"%a\ %d\ %b\ %H:%M"'
:  let l:time = '%-22.(%{strftime("%a\ %d\ %b\ %H:%M")}%)'
:  let l:linecolumn = '%-14.(%l,%c%V%)'
:  let l:position = ' %P'
:  return l:ff . l:buf . l:file . l:flags . l:middle . l:time . l:linecolumn . l:position
:endfunction
