" vundle needs this off; turn on further down below
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
call vundle#end()

let g:ale_set_highlights = 0
let g:snipMate = { 'snippet_version': 1 }

syntax enable
set background=dark
set encoding=utf8
set completeopt-=preview
set number
set wildmenu
set hidden
set expandtab
set softtabstop=4 
set shiftwidth=4
set hlsearch
set incsearch
set belloff=all
set backspace=eol,start,indent

filetype plugin indent on

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> <leader>h :nohlsearch<CR>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

if has('persistent_undo') && exists("*mkdir")
  let undo_file_dir=expand('~/.vim_undo_files')
  " Call with the p option so we don't fail
  " if the directory already exists.
  call mkdir(undo_file_dir, "p", 0o700)
  let &undodir=undo_file_dir
  set undofile
  unlet undo_file_dir
endif
