" .vimrc file created by Stephen Neithardt (c) 2006 - 2017
" 
" It requires the directory .vim to contain the following elements:
" .vim/functions/FoldText.vim
" .vim/functions/StatusLine.vim
" .vim/bash.vim
" .vim/js.vim
" .vim/php.vim
" .vim/vim.vim
"
" As well as the Vundle plugin manager folder
" .vim/bundle/Vunde.vim/
"
" This list will be kept updated as necessary.

set nocompatible

filetype off " required by Vundle

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" undo tree plugin
Plugin 'mbbill/undotree'

call vundle#end()
" Vundle end setup
filetype plugin indent on " reset filetype, as Vundle is finished

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
 
" Undo tree (managed by vundle) silent command
nnoremap <silent> <F4> :UndotreeToggle<CR>

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
