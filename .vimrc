" Plugin settings

" vundle needs this off; turn on further down below
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Linter
Plugin 'dense-analysis/ale'

" Autocomplete w/ tabs
Plugin 'lifepillar/vim-mucomplete'

" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" Color scheme
Plugin 'altercation/vim-colors-solarized'
call vundle#end()

let g:ale_set_highlights = 0

" Needed for MUcomplete
set completeopt+=menuone

" Colors
syntax enable
set background=dark
try
  " Wrap in try/catch to avoid annoying errors when we PluginInstall
  colorscheme solarized
catch /.*/
endtry

" General settings
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
set shortmess+=c
filetype plugin indent on

" Bindings
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> <leader>h :nohlsearch<CR>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Misc. settings

" Keep undo logs around when we close buffers.
" We can always add a crontab to clean up ~/.vim_undo_files
" if we're worried about disk space.
if has('persistent_undo') && exists("*mkdir")
  let undo_file_dir=expand('~/.vim_undo_files')
  call mkdir(undo_file_dir, "p", 0o700)
  let &undodir=undo_file_dir
  set undofile
  unlet undo_file_dir
endif
