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

function s:EchoWarning(msg) abort
    echohl WarningMsg
    echom a:msg
    echohl None
endfunction

" Colors
set background=dark
try
    colorscheme retrobox
catch /.*/
    call s:EchoWarning("Could not find retrobox colorscheme, update vim to 9.0 to fix")
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
set spelllang=en_us

" See after/syntax/json.vim for info.
let g:vim_json_warnings = 0

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

" This function calls :bnext or :bprevious. If the next
" buffer is a terminal window (with b:is_term set), we
" skip it. I pretty much only want to open term buffers with
" <C-t>
function NextBuffer(previous) abort
    if a:previous
        bprevious
    else
        bnext
    endif
endfunction

function NextBufferNoTerm(previous) abort
    call NextBuffer(a:previous)
    let cur_buf = bufnr('%')
    let cur_buf_is_term = getbufvar(cur_buf, "is_term")
    if cur_buf_is_term
        call NextBuffer(a:previous)
    endif
endfunction

" Buffer navigation
nnoremap <silent> <leader>B :call NextBufferNoTerm(1)<CR>
nnoremap <silent> <leader>b :call NextBufferNoTerm(0)<CR>

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

function SourceAllAutoloaded() abort
    if exists("g:loaded_text_helpers")
        runtime autoload/text_helpers.vim
    endif
endfunction

nnoremap <silent> <leader>s :call SourceAllAutoloaded()<CR> <bar> :source $MYVIMRC<CR>

" Toggle spell checker
nnoremap <silent> <leader>c :set spell!<CR>

" Open a file in a new split
function OpenFileInWindow(filename) abort
    split
    execute "edit " . a:filename
endfunction

" Some binds to quickly open config files for quick changes
" + similar for filetype configs.
nnoremap <leader>os :call OpenFileInWindow($MYVIMRC)<CR>

function GetVimDir() abort
    if $MYVIMDIR != ""
        return $MYVIMDIR
    endif
    " The env var gets set on vim >= 9.1.078. We can make a guess
    " if it's not set though.
    let rtp_entries = split(&rtp, ",")
    if len(rtp_entries) == 0
        return expand("~/.vim") . "/"
    endif
    return rtp_entries[0] . "/"
endfunction

function OpenFTConfig(filetype) abort
    let ft_config_path = GetVimDir() . "after/ftplugin/" . a:filetype . ".vim"
    if !filereadable(ft_config_path)
        call s:EchoWarning("No ft config for filetype " . a:filetype)
        return
    endif

    call OpenFileInWindow(ft_config_path)
endfunction

function OpenFTConfigCurrentFiletype() abort
    if &ft == ""
        call s:EchoWarning("No filetype detected.")
        return
    endif
    call OpenFTConfig(&ft)
endfunction

nnoremap <leader>ofs :call OpenFTConfigCurrentFiletype()<CR>


" Open a new terminal in the current window
" or switch to the terminal if we already have
" one open.
function OpenTerm(new_window) abort
    let cur_buf = bufnr('%')
    let cur_buf_is_term = getbufvar(cur_buf, "is_term")
    if cur_buf_is_term
        " Have to use execute normal so we can use <C-w>
        execute "normal! \<C-w>c"
        return
    endif

    let buf_info = getbufinfo()
    for buf in buf_info
        let is_term = getbufvar(buf.bufnr, "is_term")
        if is_term
            if a:new_window
                split
            endif
            execute "b" . string(buf.bufnr)
            return
        endif
    endfor
    if a:new_window
        split
    endif
    term ++curwin ++noclose
    let b:is_term = 1
endfunction

nnoremap <silent> <C-t> :call OpenTerm(1)<CR>
nnoremap <silent> <C-w>t :call OpenTerm(0)<CR>

" Quickly go into normal mode in the terminal
tnoremap <C-n> <C-w>N

" Quickly close the terminal
tnoremap <C-t> <C-w>c

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

" Move backwards n times to placeholder.
" For the special case where the placeholder is a single character and
" we are already on the placeholder, only move n - 1 times. This is
" to make placeholder abbreviations ending in a single-character placeholder
" work properly.
function MoveToPlaceholder(n, placeholder) abort
    let num_jumps = a:n

    if len(a:placeholder) == 1
        let cur_char = getline('.')[col('.') - 1]
        if cur_char ==# a:placeholder
            let num_jumps -= 1
        endif
    endif

    for _ in range(num_jumps)
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
    let idx = match(a:string, a:pattern)
    while idx != -1
        let result += 1
        let idx = match(a:string, a:pattern, idx + pattern_len)
    endwhile
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
        let placeholder = "___"
    endif
    let num_placeholders = s:CountNumOccurences(a:expanded, placeholder)
    let cmd = "iabbrev <buffer> " . a:abbreviation . " " . a:expanded .
        \ "<Esc>:call MoveToPlaceholder(" . string(num_placeholders) . ", \"" . placeholder . "\")" .
        \ "<CR>/" . placeholder . "<CR><C-o>cw<C-r>=EatNonKeyword()<CR>"
    execute cmd
endfunction

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
" Surprisingly, the order matters here. :syntax enable will
" execute :doautoall filetypedetect BufRead if the ftplugins
" have not been loaded before it's called. This means that
" sourcing my vimrc does exactly what I want - a bit
" hacky/fragile, but whatever.
syntax enable
filetype plugin indent on

