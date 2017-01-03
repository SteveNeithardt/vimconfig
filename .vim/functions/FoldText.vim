" helper file for .vimrc by Stephen Neithardt (c) 2006 - 2017

:function! FoldText()
:  let l:winwidth= winwidth(0) - &foldcolumn - (&number ? 8 : 0)
:  let l:subline = getline(v:foldstart)
:  let l:subchars = '%\|//\|/\*\|{{{\d*\|"\s'
:  let l:subline = substitute(l:subline,l:subchars,'','g')
:  let l:subline = substitute(l:subline,'^\s*','','')
:  let l:interval = v:foldend - v:foldstart + 1
:  let l:foldPercentage = printf("(%.1f", (l:interval*1.0)/line("$")*100) . "%) "
:  let l:interval = " " . l:interval . " lines "
:  let l:expandChars = repeat("-",max([l:winwidth/2-strlen(l:subline.l:interval),2]))
:  let l:returnvalue0 = l:subline.l:expandChars.l:interval.l:foldPercentage
:  let l:endChars = repeat("-",l:winwidth-strlen(l:returnvalue0)+1)
:  let l:returnvalue = l:returnvalue0.l:endChars.v:foldlevel
:  return l:returnvalue
:endfunction
