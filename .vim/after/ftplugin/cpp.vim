" These settings are also applied to CUDA files
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" Note that this is the default in newer versions of vim
setlocal commentstring=//\ %s

iabbrev <buffer> iA #include
iabbrev <buffer> dA #define

call CreatePlaceholderAbbrev("mainA", "int main() {<CR>_<CR>}")
call CreatePlaceholderAbbrev("flA", "for (auto _ : _) {<CR>_<CR>}")
call CreatePlaceholderAbbrev("prA", "std::cout << _ << std::endl;")
call CreatePlaceholderAbbrev("iflA", "for (int _ = _; _ < _; _) {<CR>_<CR>}")
call CreatePlaceholderAbbrev("wlA", "while (_) {<CR>_<CR>}")
call CreatePlaceholderAbbrev("teA", "template <typename _>")
