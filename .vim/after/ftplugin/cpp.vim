" Just like in cuda.vim, this is already done by vim's default
" plugin. But it's not documented or guaranteed, so we do it again
" just in case.
runtime after/ftplugin/c.vim

" Note that this is the default in newer versions of vim
setlocal commentstring=//\ %s

iabbrev <buffer> teA template <typename
iabbrev <buffer> tyA typename

call CreatePlaceholderAbbrev("flA", "for (auto ___ : ___) {<CR>___<CR>}")
call CreatePlaceholderAbbrev("prA", "std::cout << ___ << std::endl;")
call CreatePlaceholderAbbrev("wlA", "while (___) {<CR>___<CR>}")
