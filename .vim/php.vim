" helper file for .vimrc by Stephen Neithardt (c) 2006 - 2017

map <silent> <buffer> <F5> :s/\(\s*\)/\1\/\//<CR>
map <silent> <buffer> <F6> :s/\(\s*\)\/\//\1/<CR>

" Special shift F5(F6) (un)commenting methods for the html parts
map <silent> <buffer> <S-F5> :s/\(\s*\)\(.*\)/\1<!--\2-->/<CR>
map <silent> <buffer> <S-F6> :s/\(\s*\)<!--\(.*\)-->/\1\2/<CR>
