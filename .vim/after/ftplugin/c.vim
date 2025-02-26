" These settings are also applied to CUDA/C++ files
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

iabbrev <buffer> iA #include
iabbrev <buffer> dA #define

call CreatePlaceholderAbbrev("mainA", "int main() {<CR>___<CR>}")
call CreatePlaceholderAbbrev("iflA", "for (int ___ = ___; ___ < ___; ___) {<CR>___<CR>}")

