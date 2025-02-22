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

" Lets you comment out things quickly
Plugin 'tpope/vim-commentary'

call vundle#end()

let g:ale_set_highlights = 0
let g:ale_virtualtext_cursor = 0
let g:ale_fix_on_save = 1
" I use YCM for LSP stuff, so I only need ALE's linting capabilities.
let g:ale_disable_lsp = 1

" Colors
set background=dark
try
    colorscheme retrobox
catch /.*/
    echohl WarningMsg
    echom "Could not find retrobox colorscheme, update vim to 9.0 to fix"
    echohl None
endtry

" General settings
set encoding=utf8
set completeopt-=preview
set number
set relativenumber
set wildmenu
set hidden
set incsearch
set belloff=all
set backspace=eol,start,indent
set shortmess+=c
set laststatus=2
set jumpoptions=stack

" Don't set it again if it's already on.
" Otherwise, highlighting will be turned on
" again when we source this vimrc, which can
" be pretty annoying.
if !&hlsearch
    set hlsearch
endif

" Statusline config. Close to the default described in
" :help statusline examples with some modifications.
" Start with the default filename + flags (help/modified
" readonly/etc).
set statusline=%<%f\ %h%w%m%r
" The rest of the default statusline: line/col info, etc.
" Replace the percentage with line x/total file len.
set statusline+=%=%-14.(%c%V%)\ %l/%L

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

" Some tricky behavior here - these should be run after the
" global options are set!
"
" In addition to the .vimrc, we have a bunch of ftplugins
" that each have their own .vim file with a bunch
" of buffer-local mappings, abbreviations, etc.
" myfiletype.vim files usually get sourced when you first open
" foo.myfiletype. When we toggle the filetype off -> on, all of
" these files will get sourced again. This means that we can
" mess with filetype settings without resetting vim - good!
" But the order matters, because if we set a global option after
" this happens, it will override the intended filetype specific
" settings in foo.myfiletype.
"
" syntax enable will also turn filetype on - so it has to be
" here too.
syntax enable
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
nnoremap <silent> <leader>B :bprevious<CR>
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

" Turn off highlighting
nnoremap <silent> <leader>h :nohlsearch<CR>

" Source this vimrc for quick changes
nnoremap <silent> <leader>s :source $MYVIMRC<CR>

" Open a new terminal in the current window
" or switch to the terminal if we already have
" one open.
function OpenTerm() abort
    let buf_info = getbufinfo()
    for buf in buf_info
        let is_term = getbufvar(buf.bufnr, "is_term")
        if is_term
            execute "b" . string(buf.bufnr)
            return
        endif
    endfor
    term ++curwin ++noclose
    let b:is_term = 1
endfunction

nnoremap <silent> <leader>t :call OpenTerm()<CR>

" Quickly go into normal mode in the terminal
tnoremap <C-n> <C-w>N

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
function s:CommentaryHack() abort
    set nosmd
    set smd
endfunction
autocmd! User CommentaryPost call s:CommentaryHack()

" Helpers for abbreviations (I mostly have these defined in ftplugin).
" First, add extra characters to the keyword set. This is to prevent
" vim from expanding abbreviations in scenarios where it would be
" undesirable (for example, 'main' is a common abbreviation for me -
" I don't want vim to expand stuff like 'def main(')
let &iskeyword=&iskeyword . ',('

" This function consumes the last character matching `pat` when
" expanding an abbreviation.
" This function is taken directly from the vim docs, see :helpgrep Eatchar
function s:EatChar(pat) abort
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? "" : c
endfunction

function EatNonKeyword() abort
    return s:EatChar('[^[:keyword:]]')
endfunction

" Move backwards n times to placeholder
function MoveToPlaceholder(n, placeholder) abort
    for _ in range(a:n)
        call search(a:placeholder, "b")
    endfor
endfunction

" Count the number of times pattern occurs in string (non-overlapping)
function s:CountNumOccurences(string, pattern) abort
    let pattern_len = len(a:pattern)
    if pattern_len == 0
        return 0
    endif

    let result = 0
    let idx_pattern = 0
    for c in a:string
        if c ==# a:pattern[idx_pattern]
            let idx_pattern = idx_pattern + 1
            if idx_pattern == pattern_len
                let result = result + 1
                let idx_pattern = 0
            endif
        else
            let idx_pattern = 0
        endif
    endfor

    return result
endfunction

" Helper function that creates a special insert mode abbreviation.
" The abbreviation will:
" 1. Substitute 'abbreviation' with 'expanded'
" 2. Search backwards for the 3rd argument 'placeholder'. If no placeholder
" is given, the default is an underscore
" 3. Delete the first placeholder and enter insert mode. Any non-keyword
" characters inserted by vim are also deleted.
" 4. After this, you can jump to the next placeholder with n in normal mode.
"
" For example:
" call CreatePlaceholderAbbrev('fl', 'for _ in _:')
" You will end up with 'for in _:' in insert mode, where the cursor
" is between 'for' and 'in'.
function CreatePlaceholderAbbrev(abbreviation, expanded, ...) abort
    if a:0 > 0
        let placeholder = a:1
    else
        let placeholder = "_"
    endif
    let num_placeholders = s:CountNumOccurences(a:expanded, placeholder)
    let cmd = "iabbrev <buffer> " . a:abbreviation . " " . a:expanded .
        \ "<Esc>:call MoveToPlaceholder(" . string(num_placeholders) . ", \"" . placeholder . "\")" .
        \ "<CR>*``cw<C-R>=EatNonKeyword()<CR>"
    execute cmd
endfunction
