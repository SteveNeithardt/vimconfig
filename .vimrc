set nocompatible
set vb
set nu
set backspace=indent,eol,start
set background=dark
set scrolloff=3
set showcmd
set virtualedit=all
set history=99
set splitright
set incsearch
set nohlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=longest,list
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set listchars+=tab:T-
set listchars+=trail:*
set ruler
set winminheight=0
set colorcolumn=80
set autoindent
set smartindent
set laststatus=2

source ~/.vim/functions/StatusLine.vim
set statusline=%!StatusLine()

syntax on
colorscheme koehler
hi StatusLine  ctermbg=blue ctermfg=white

map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

let mapleader='-'
map <leader>te :tabedit 
map <leader>h :tabprev<CR>
map <leader>l :tabnext<CR>
 

" folding options
if has("folding")
	set foldenable
	set foldcolumn=3
	source ~/.vim/functions/FoldText.vim
	set foldtext=FoldText()
endif " has("folding")

map <F3> :set invhlsearch<CR>
map <F2> :set invlist<CR>
map <F11> :set invexpandtab<CR>

if has('autocmd')
	au BufRead,BufNewFile *.js source ~/.vim/js.vim
	au BufRead,BufNewFile *.php source ~/.vim/php.vim
	au BufRead,BufNewFile *.sh source ~/.vim/bash.vim
	au BufRead,BufNewFile *.vim,.vimrc source ~/.vim/vim.vim
endif
