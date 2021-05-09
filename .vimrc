"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle (Plugin manager)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle needs this; turn on further down below
filetype off

" Add vundle to runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" Add plugins here
call vundle#begin()

" Plugin manager
Plugin 'VundleVim/Vundle.vim'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
syntax enable

" Colors
colorscheme peaksea
set background=dark

" Standard encoding
set encoding=utf8

" Show line numbers
set number

" Menu for autocomplete
set wildmenu

filetype plugin on
filetype indent on

" Change leader to , (default is \, too far)
let mapleader=','

" Turn off preview window
set completeopt-=preview

" For MacBooks
set backspace=indent,eol,start

" Mouse in normal mode
set mouse=n

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Number of spaces to display when a <TAB> is read
set tabstop=4 

" Number of spaces to insert on <TAB>/delete on backspace
set softtabstop=4

" Write spaces instead of <TAB>s
set expandtab

" Tab width for automatic indentation
set shiftwidth=4

" Enable folding
set foldenable

" Fold by indent level
set foldmethod=indent

" Number of folds to initially open 
set foldlevelstart=5

" Max fold level
set foldnestmax=5

" Bind fold toggle
nnoremap <leader>f za
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight matches
set hlsearch

" Highlight as characters are entered
set incsearch

" ,h turns off highlighting in normal mode
nnoremap <leader>h :nohlsearch<CR>

