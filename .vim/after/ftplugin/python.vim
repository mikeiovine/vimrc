" Run the script
nnoremap <buffer> <localleader>r :!clear; python3 %<CR>

let b:ale_fixers = [
\   'trim_whitespace',
\   'yapf',
\]

let b:ale_linters = ['flake8']

iabbrev <buffer> mainA if __name__ == "__main__":

call CreatePlaceholderAbbrev("flA", "for ___ in ___:<CR>___")
call CreatePlaceholderAbbrev("wlA", "while ___:<CR>___")
call CreatePlaceholderAbbrev("clA", "class ___:<CR>___")
call CreatePlaceholderAbbrev("prA", "print(___)")
call CreatePlaceholderAbbrev("fnA", "def ___(___):<CR>___")
