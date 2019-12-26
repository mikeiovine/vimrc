""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" filetype on -> Turn on filetype detection
" plugin      -> Run 'ftplugin.vim' from runtimepath. If there is a plugin
"                for the detected filetype, load that file.
" indent      -> Run 'indent.vim' from runtimepath. Loads an indent script
"                for the detected filetype if one exists.   
filetype plugin indent on

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

" ] toggles folds
nnoremap ] za
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight matches
set hlsearch

" Highlight as characters are entered
set incsearch

" Space turns off highlighting in normal mode
nnoremap <space> :nohlsearch<CR>
