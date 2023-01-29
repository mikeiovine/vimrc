" Run the script
nnoremap <leader>r :!clear; python3 %<CR>

let b:ale_fixers = [
\   'trim_whitespace',
\   'black',
\   'autoflake',
\   'autopep8',
\]

iabbrev pymain if __name__ == "__main__":
