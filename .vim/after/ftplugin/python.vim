" Run the script
nnoremap <leader>r :!clear; python3 %<CR>

let b:ale_fixers = [
\   'trim_whitespace',
\   'black',
\   'autoflake',
\   'autopep8',
\]

iabbrev pymain if __name__ == "__main__":
iabbrev pyinit def __init__(self,
iabbrev pyutest import unittest<CR>class TestCase(unittest.TestCase):<CR>
