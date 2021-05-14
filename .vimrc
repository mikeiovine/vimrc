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

" Line numbers
set number

" Menu for command autocomplete
set wildmenu

filetype plugin on
filetype indent on

" For MacBooks
set backspace=indent,eol,start

" Allow use of mouse in normal mode
set mouse=n

" Buffer management
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" For *do commands
set hidden

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Write spaces instead of <TAB>s
set expandtab

" Number of spaces to insert when <TAB> is hit (or to delete when
" backspace is hit)
set softtabstop=4 

" Tab width for automatic indentation
set shiftwidth=4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search matches
set hlsearch

" Highlight as characters are entered
set incsearch

" \h turns off highlighting in normal mode
nnoremap <silent> <leader>h :nohlsearch<CR>

