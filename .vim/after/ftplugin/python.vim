" Run the script
nnoremap <buffer> <localleader>r :!clear; python3 %<CR>

let b:ale_fixers = [
\   'trim_whitespace',
\   'yapf',
\]

iabbrev <buffer> main if __name__ == "__main__":
iabbrev <buffer> imp import

call CreatePlaceholderAbbrev("fl", "for _ in _:")
call CreatePlaceholderAbbrev("wl", "while _:")
call CreatePlaceholderAbbrev("cl", "class _:")
call CreatePlaceholderAbbrev("pr", "print(_)")
call CreatePlaceholderAbbrev("fn", "def _(_)")
