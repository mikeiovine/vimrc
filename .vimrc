" Plugin settings
" vundle needs this off; turn on further down below
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Linter
Plugin 'dense-analysis/ale'

" Autocomplete
Plugin 'ycm-core/YouCompleteMe'

" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" Color scheme
Plugin 'altercation/vim-colors-solarized'

" Lets you comment out things quickly
Plugin 'tpope/vim-commentary'

call vundle#end()

let g:ale_set_highlights = 0
let g:ale_virtualtext_cursor = 0
let g:ale_fix_on_save = 1
" I use YCM for LSP stuff, so I only need ALE's linting capabilities.
let g:ale_disable_lsp = 1

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
set relativenumber
set wildmenu
set hidden
set hlsearch
set incsearch
set belloff=all
set backspace=eol,start,indent
set shortmess+=c

" For fast escape to normal mode when pressing
" ESC in insert mode
set ttimeoutlen=10

" Tab stuff. Override in filetype-specific
" configs if necessary.
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

filetype plugin indent on

" Bindings

let mapleader = ","
let maplocalleader = ","

" By default, comma makes you repeat the last f/F command
" in the opposite direction. I rarely use this feature,
" but since we mapped <leader> to comma there can be
" a huge delay when I do use it. This bind makes it so
" we have to press comma twice to do the default movement.
" Slightly annoying, but at least there's no lag.
nnoremap <leader>, ,

" Buffer navigation
nnoremap <silent> <leader>b :bprevious<CR>
nnoremap <silent> <leader>b :bnext<CR>

" Arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Note that jump to definition will only work if we have LSP
" completers enabled.
nnoremap <silent> <C-j> :YcmCompleter GoToDefinition<CR>

" Open a window 
nnoremap <leader>v <C-w><C-v>
" Close a buffer without closing window
nnoremap <silent> <leader>x :bp\|bd #<CR>
" Close a window without closing buffer
nnoremap <leader>z <C-w>c

" Move between windows
nnoremap <leader>w <C-W><C-W>

" Turn off highlighting
nnoremap <silent> <leader>h :nohlsearch<CR>

" Operator pending mapping for stuff inside parentheses
onoremap p i(

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

" Horrible hack for the vim-commentary plugin. When I enter
" visual mode and comment out my selection with gc, the
" -- VISUAL -- indicator at the bottom of the screen doesn't
" go away. This seems like a vim bug because it only happens
" on vim 9+, vim 8 is fine. This just makes it go away by
" toggling the show mode setting.
function CommentaryHack()
    set nosmd
    set smd
endfunction
autocmd User CommentaryPost call CommentaryHack()
