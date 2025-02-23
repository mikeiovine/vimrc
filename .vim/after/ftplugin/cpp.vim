" These settings are also applied to CUDA files
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" Note that this is the default in newer versions of vim
setlocal commentstring=//\ %s

iabbrev <buffer> iA #include
iabbrev <buffer> dA #define

call CreatePlaceholderAbbrev("mainA", "int main() {<CR>___<CR>}")
call CreatePlaceholderAbbrev("flA", "for (auto ___ : ___) {<CR>___<CR>}")
call CreatePlaceholderAbbrev("prA", "std::cout << ___ << std::endl;")
call CreatePlaceholderAbbrev("iflA", "for (int ___ = ___; ___ < ___; ___) {<CR>___<CR>}")
call CreatePlaceholderAbbrev("wlA", "while (___) {<CR>___<CR>}")
call CreatePlaceholderAbbrev("teA", "template <typename ___>")
