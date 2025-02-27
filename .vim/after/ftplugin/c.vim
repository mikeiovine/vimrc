" These settings are also applied to CUDA/C++ files
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

iabbrev <buffer> iA #include
iabbrev <buffer> dA #define

call CreatePlaceholderAbbrev("mainA", "int main() {<CR>___<CR>}")
call CreatePlaceholderAbbrev("iflA", "for (int ___ = ___; ___ < ___; ___) {<CR>___<CR>}")

" By default, ALE uses clang/nvcc/etc to provide diagnostics for C-family
" languages. This is wasteful for me because I already use YCM for this
" exact thing. I don't really need any of the linters here, so just disable
" them all (maybe I'll add fixers for code formatting later...)
let b:ale_linters = []
