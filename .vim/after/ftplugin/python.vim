" Run the script
nnoremap <buffer> <localleader>r :!clear; python3 %<CR>

let b:ale_fixers = [
\   'trim_whitespace',
\   'black',
\   'autoflake',
\   'autopep8',
\]

iabbrev <buffer> pymain if __name__ == "__main__":
iabbrev <buffer> pyinit def __init__(self,
iabbrev <buffer> pyutest import unittest<CR>class TestCase(unittest.TestCase):<CR>
