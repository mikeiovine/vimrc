" Run the script
nnoremap <buffer> <localleader>r :!clear; python3 %<CR>

let b:ale_fixers = [
\   'trim_whitespace',
\   'yapf',
\]

iabbrev <buffer> mainA if __name__ == "__main__":

call CreatePlaceholderAbbrev("flA", "for _ in _:<CR>_")
call CreatePlaceholderAbbrev("wlA", "while _:<CR>_")
call CreatePlaceholderAbbrev("clA", "class _:<CR>_")
call CreatePlaceholderAbbrev("prA", "print(_)")
call CreatePlaceholderAbbrev("fnA", "def _(_):<CR>_")
