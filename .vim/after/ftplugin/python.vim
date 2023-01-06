" Run the script
nnoremap <leader>r :!clear; python3 %<CR>

let b:ale_fixers = [
\   'trim_whitespace',
\   'black',
\   'autoflake',
\   'autopep8',
\]
