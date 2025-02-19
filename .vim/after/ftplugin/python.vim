" Run the script
nnoremap <buffer> <localleader>r :!clear; python3 %<CR>

let b:ale_fixers = [
\   'trim_whitespace',
\   'yapf',
\]

iabbrev <buffer> main if __name__ == "__main__":
iabbrev <buffer> imp import
" In all of the abbreviations below, EatNonKeyword prevents vim from
" inserting an extra space/newline after we type the abbreviation.

" Esc + ?P to search backwards for PLACEHOLDER, n to go to the first
" one and cw to re-enter insert mode.
iabbrev <buffer> fl for PLACEHOLDER in PLACEHOLDER:<Esc>?P<CR>ncw<C-R>=EatNonKeyword()<CR>
iabbrev <buffer> wl while PLACEHOLDER:<Esc>?P<CR>cw<C-R>=EatNonKeyword()<CR>
iabbrev <buffer> cl class PLACEHOLDER:<Esc>?P<CR>cw<C-R>=EatNonKeyword()<CR>
" Similar to the above, except we search (but do not jump to) the open
" bracket so we can easily add function arguments after typing the name.
iabbrev <buffer> fn def PLACEHOLDER():<Esc>?P<CR>/(<CR>``cw<C-R>=EatNonKeyword()<CR>
